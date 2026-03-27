import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';

const RESEND_API_KEY = Deno.env.get('RESEND_API_KEY')!;
const TO_EMAILS = ['contatoigorpinheiro@gmail.com'];

serve(async (req) => {
  if (req.method !== 'POST') {
    return new Response('Method not allowed', { status: 405 });
  }

  const payload = await req.json();
  const record = payload.record;

  const html = `
    <h2>Novo lead de revendedor — Vizor Películas</h2>
    <table cellpadding="8" style="border-collapse:collapse;font-family:sans-serif;font-size:15px;">
      <tr><td><strong>Nome</strong></td><td>${record.nome}</td></tr>
      <tr><td><strong>Empresa</strong></td><td>${record.empresa}</td></tr>
      <tr><td><strong>Cidade</strong></td><td>${record.cidade}</td></tr>
      <tr><td><strong>WhatsApp</strong></td><td>${record.whatsapp}</td></tr>
      <tr><td><strong>Recebido em</strong></td><td>${new Date(record.created_at).toLocaleString('pt-BR', { timeZone: 'America/Sao_Paulo' })}</td></tr>
    </table>
  `;

  const res = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${RESEND_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: 'Vizor Películas <onboarding@resend.dev>',
      to: TO_EMAILS,
      subject: `Novo revendedor: ${record.nome} — ${record.empresa}`,
      html,
    }),
  });

  if (!res.ok) {
    const err = await res.text();
    return new Response(`Resend error: ${err}`, { status: 500 });
  }

  return new Response('ok', { status: 200 });
});
