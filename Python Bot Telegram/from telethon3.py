from telethon.sync import TelegramClient
from telethon.errors import FloodWaitError
from telethon.tl.types import User
import random
import datetime
import pandas as pd # type: ignore
import os
import asyncio

# Configurar

conta = {
    "api_id": xxxxxxx,
    "api_hash": "xxxxxxxxxx",
    "phone": "+telefone",
    "nome": "conta1",
    "grupo_alvo": "grupoforexcomjuniorferreira"
}

mensagens = [
    "sua mensagem",
]

quantidade_envio = 60 #total de envio
arquivo_ids = "enviados.csv"
registros = []

# LER IDs ENVIADOS
if os.path.exists(arquivo_ids):
    df_ids = pd.read_csv(arquivo_ids)
    ids_enviados = set(df_ids["id"].astype(str).tolist())
else:
    ids_enviados = set()

# ENVIO
async def enviar_mensagens(client, participantes):
    enviados = 0
    print(f"Iniciando envio com {conta['nome']}...")

    for user in participantes:
        if not isinstance(user, User) or user.bot or user.deleted:
            continue

        username_ou_id = str(user.username or user.id)

        if username_ou_id in ids_enviados:
            print(f"[↪] Já enviado para {username_ou_id}, pulando.")
            continue

        try:
            texto = random.choice(mensagens)
            await client.send_message(user.id, texto)
            print(f"[✔] Enviado para {username_ou_id}")
            enviados += 1

            registros.append({
                "conta": conta["nome"],
                "id": user.id,
                "username": user.username or "<sem username>",
                "data_envio": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            })

            with open(arquivo_ids, "a", encoding="utf-8") as f:
                if f.tell() == 0:
                    f.write("id\n")
                f.write(f"{username_ou_id}\n")

            ids_enviados.add(username_ou_id)

            if enviados >= quantidade_envio:
                break

            await asyncio.sleep(random.randint(180, 300))

        except FloodWaitError as e:
            print(f"[⚠️ FloodWait] Aguardando {e.seconds} segundos...")
            await asyncio.sleep(e.seconds)
        except Exception as e:
            print(f"[✖] Erro com {username_ou_id}: {e}")
            await asyncio.sleep(10)

    print(f"Finalizado. Total enviado: {enviados}")


async def main():
    client = TelegramClient(conta['phone'], conta['api_id'], conta['api_hash'])
    await client.start()
    print(f"Logado como {conta['nome']}")

    participantes = await client.get_participants(conta['grupo_alvo'])
    random.shuffle(participantes)

    await enviar_mensagens(client, participantes)
    await client.disconnect()

    #  Excel
    download_path = os.path.join(os.path.expanduser("~"), "Downloads")
    nome_arquivo = f"usuarios_enviados_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.xlsx"
    caminho = os.path.join(download_path, nome_arquivo)

    df = pd.DataFrame(registros)
    df.to_excel(caminho, index=False)
    print(f" Arquivo Excel salvo em: {caminho}")


asyncio.run(main())
