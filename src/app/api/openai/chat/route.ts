import { NextRequest, NextResponse } from 'next/server';
import { StreamingTextResponse, OpenAIStream } from 'ai';
import OpenAI from 'openai';

const openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY || '' });

export async function POST(req: NextRequest) {
  const { messages } = await req.json();

  if (!process.env.OPENAI_API_KEY) {
    console.warn('OpenAI API key not found. Using placeholder response.');
    return new NextResponse(JSON.stringify({
      message: "This is a placeholder response. OpenAI integration is not currently active."
    }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' }
    });
  }

  const response = await openai.chat.completions.create({
    model: 'gpt-3.5-turbo',
    messages,
    stream: true,
  });

  const stream = OpenAIStream(response);
  return new StreamingTextResponse(stream);
}
