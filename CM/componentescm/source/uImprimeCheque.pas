{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                12/12/2003 - André Tavares - pendência 15063 }
{                                                       }
{*******************************************************}
unit uImprimeCheque;

interface

Uses Classes, Forms, Windows, ComPort, SysUtils;

Type
//início - André Tavares - 12/12/2003 - pendência 15063
//  TNomeImpressora = (niChronos_ACC100,niChronos_ACC300);
  TNomeImpressora = (niChronos_ACC100,niChronos_ACC300, NSC_201);
//fim - André Tavares - 12/12/2003 - pendência 15063

Type
  TCmImprimeCheque = Class(TCustomComPort)
  Private
     FNomeImpressora :TNomeImpressora;
     fValor          :String;
     fFavorecido     :String;
     fLocalidade     :String;
     fData           :String;
     fCodBanco       :String;
  Public
     Constructor Create(AOwner: TComponent); Override;
     Destructor  Destroy; Override;
     Function    ModelosImpressoras:String;
     Function    Inicializar: Boolean;
     Procedure   Imprime;
     Procedure   ImprimeVerso(Slinhas :Array of String);
     Property    Valor          :String          read fValor          write fValor;
     Property    Favorecido     :String          read fFavorecido     write fFavorecido;
     Property    Localidade     :String          read fLocalidade     write fLocalidade;
     Property    Data           :String          read fData           write fData;
     Property    CodBanco       :String          read fCodBanco       write fCodBanco;
  Published
     Property NomeImpressora :TNomeImpressora read FNomeImpressora Write FNomeImpressora;
     Property BaudRate;
     Property DataBits;
     Property StopBits;
     Property Parity;
     Property DeviceName;
End;


implementation

Constructor TCmImprimeCheque.Create(AOwner: TComponent);
Begin
  Inherited Create(AOwner);
  fValor      := '0';
  fFavorecido := 'Não informado';
  fLocalidade := 'Não informado';
  fData       := '00/00/00';
  fCodBanco   := '000';
End;

Destructor TCmImprimeCheque.Destroy;
Begin
   Inherited Destroy;

End;

Function TCmImprimeCheque.Inicializar: Boolean;
Var
  sAux: String;
Begin
  If Not Self.Active Then Self.Open;
  Result := False;
  Self.WriteString(#0);
  Application.ProcessMessages;
  SAux := Self.ReadString;
  If sAux = '' Then sAux := ' ';
  Case sAux[1] Of
       '1': Application.MessageBox('Buffer de Impressão Cheio','Status Impressora',Mb_IconStop);
       '2': Application.MessageBox('Sem Papel','Status Impressora',Mb_IconStop);
       '3': Application.MessageBox('Impressão em Andamento','Status Impressora',Mb_IconStop);
       '4': Application.MessageBox('Falha na Margem','Status Impressora',Mb_IconStop);
       '5': Application.MessageBox('Erro inesperado','Status Impressora',Mb_IconStop);
       '6': Application.MessageBox('Falha no motor','Status Impressora',Mb_IconStop);
       '7': Application.MessageBox('Erro de Paridade','Status Impressora',Mb_IconStop);
  Else
    Result := True;
  End;
End;

Procedure TCmImprimeCheque.Imprime;
Begin
  If Not Self.Active Then Self.Open;

  case NomeImpressora of
    niChronos_ACC100,niChronos_ACC300:
    Begin
       Self.WriteString(#27 + #64);
       Application.ProcessMessages;
       Self.WriteString(#27 + #160);
       Self.WriteString(fFavorecido + #13);
       Application.ProcessMessages;
       Self.WriteString(#27 + #161);
       Self.WriteString(fLocalidade + #13);
       Application.ProcessMessages;
       Self.WriteString(#27 + #162);
       Self.WriteString(fCodBanco + #13);
       Application.ProcessMessages;
       Self.WriteString(#27 + #163);
       Self.WriteString(fValor + #13);
       Application.ProcessMessages;
       Self.WriteString(#27 + #164);
       Self.WriteString(fData + #13);
       Application.ProcessMessages;
       Self.WriteString(#27 + #177);
       Application.ProcessMessages;
       Self.WriteString(#27 + #176);
       Application.ProcessMessages;
    End;
//início - André Tavares - 12/12/2003 - pendência 15063
    NSC_201:
    Begin
      Application.ProcessMessages;
      Self.WriteString(#27 + #88 +#76 +#36);  // LIMPA O RELATÓRIO
      Application.ProcessMessages;
      Self.WriteString(#27 + #6 + fCodBanco +#36);
      Application.ProcessMessages;
      Self.WriteString(#27 + #67 + fLocalidade + #36);
      Application.ProcessMessages;
      Self.WriteString(#27 + #68 + fData +#36);
      Application.ProcessMessages;
      Self.WriteString(#27 + #70 + fFavorecido + #36);
      Application.ProcessMessages;
      Self.WriteString(#27 + #86 + fValor +#36);
      Application.ProcessMessages;
      Self.WriteString(#12); // form feed para iniciar a impressão

    End;
//fim - André Tavares - 12/12/2003 - pendência 15063
  Else
   Begin
    Application.MessageBox('Modelo de impressora não configurado','Atenção',Mb_IconInformation);
    Abort;
   End;
  End;
End;

Procedure TCmImprimeCheque.ImprimeVerso(Slinhas :Array of String);
Var
  X, iNumLinhas: Integer;
Begin
  If Not Self.Active Then Self.Open;

  iNumLinhas := High(sLinhas);

  If iNumLinhas > 16 Then iNumLinhas := 16;

  case NomeImpressora of
    niChronos_ACC100,niChronos_ACC300:
    Begin
       Self.WriteString(#27 + #64);
       Application.ProcessMessages;

       For X:= 0 To iNumLinhas - 1 Do
       Begin
         If (Trim(sLinhas[x]) <> '') Then
         Begin
           Self.WriteString(sLinhas[x] + #13 + #10);
           Application.ProcessMessages;
         End;
       End;

       Self.WriteString(#27 + #177);
       Application.ProcessMessages;
       Self.WriteString(#27 + #176);
       Application.ProcessMessages;
    End;

//início - André Tavares - 12/12/2003 - pendência 15063
    NSC_201:
    Begin
      For X:= 0 To iNumLinhas - 1 Do
      Begin
        If (Trim(sLinhas[x]) <> '') Then
        Begin
         Self.WriteString(#32+ #32+ #32+ #32+ #32+ #32+ #32+ #32+ #32+ #32+ sLinhas[x] + #10 );
         Application.ProcessMessages;
        End;
      End;
      Self.WriteString(#12); // form feed para iniciar a impressão
    End;
//fim - André Tavares - 12/12/2003 - pendência 15063

  Else
   Begin
    Application.MessageBox('Modelo de impressora não configurado','Atenção',Mb_IconInformation);
    Abort;
   End;
  End;
End;

Function TCmImprimeCheque.ModelosImpressoras:String;
Var
  Lst: TStrings;
Begin
  Lst := TStringList.Create;
  Lst.Add('CHRONOS - ACC 100');
  Lst.Add('CHRONOS - ACC 300');
//início - André Tavares - 12/12/2003 - pendência 15063
  Lst.Add('SCHALTER - NSC 2.01');
//fim - André Tavares - 12/12/2003 - pendência 15063
  Result := Lst.Text;
  Lst.Free;
End;

end.
