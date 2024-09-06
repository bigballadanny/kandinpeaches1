import { NextRequest, NextResponse } from 'next/server';

export async function POST(request: NextRequest) {
  const { message } = await request.json();

  // Process the incoming message here
  console.log('Received message:', message);

  // Send a response back to Telegram
  return NextResponse.json({ ok: true });
}