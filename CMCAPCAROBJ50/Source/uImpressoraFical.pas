unit uImpressoraFical;

interface

Uses Classes, Forms, Windows, ComPort, SysUtils;

Type
  TNomeImpFiscal = (niChronos_ACC100, niChronos_ACC300, NSC_201, NSC_218);

Type
  TCmImpressoraFiscal = Class(TCustomComPort)
  Private
     fValor          :String;
     fFavorecido     :String;
     fLocalidade     :String;
     fData           :String;
     fCodBanco       :String;
     FNomeImpFiscal: TNomeImpFiscal;
    procedure SetNomeImpFiscal(const Value: TNomeImpFiscal);
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
     Property NomeImpFiscal :TNomeImpFiscal read FNomeImpFiscal write SetNomeImpFiscal;
  Published
     Property BaudRate;
     Property DataBits;
     Property StopBits;
     Property Parity;
     Property DeviceName;
End;


implementation

Constructor TCmImpressoraFiscal.Create(AOwner: TComponent);
Begin
  Inherited Create(AOwner);
  fValor      := '0';
  fFavorecido := 'Não informado';
  fLocalidade := 'Não informado';
  fData       := '00/00/00';
  fCodBanco   := '000';
End;

Destructor TCmImpressoraFiscal.Destroy;
Begin
   Inherited Destroy;

End;

Function TCmImpressoraFiscal.Inicializar: Boolean;
Var
  sAux: String;
Begin
  try
    If Not Self.Active Then
      Self.Open;
  except
    raise exception.Create('Não Foi Possível Conectar com a Porta COM');
  end;

  Result := False;
  if NomeImpFiscal <> NSC_218 then
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

Procedure TCmImpressoraFiscal.Imprime;
  //André Tavares - 28/03/2007 - pendência 24916
  function removeCar(s: string; subs: string): String;
  var i: integer;
  begin
    result := s;
    for i := 1 to length(result) do
    begin
      while pos(subs, result) > 0 do
        delete(result, pos(subs, result), 1);
    end;
  end;

Begin
  try
    If Not Self.Active Then
      Self.Open;
  except
    raise exception.Create('Não Foi Possível Conectar com a Porta COM');
  end;

  case NomeImpFiscal of
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
    NSC_201:
    Begin
      Application.ProcessMessages;
      Self.WriteString(#27 + #88 +#76);  // LIMPA O RELATÓRIO
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
//início - André Tavares - 28/03/2007 - pendência 24916
    NSC_218:
    Begin
      // Envia comandos de impressão
      If Self.Active Then
        Self.Close;

      Self.BaudRate   := br9600;
      Self.DataBits   := db8;
      Self.StopBits   := sb2;
      Self.Parity     := paNone;

      If Not Self.Active Then
        Self.Open;
      try
        Self.WriteString(#27);
        Self.WriteString(#27 + 'X' + 'L');
        Self.WriteString(#27 + 'B' + fCodBanco);
        Self.WriteString(#27 + 'F' + fFavorecido +'$');
        Self.WriteString(#27 + 'C' + fLocalidade + '$');
        Self.WriteString(#27 + 'D' + formatDateTime('DDMMYY', strToDate(fData)));

        fValor := removeCar(formatfloat('#,##0.00', strToFloat(fValor)), '.');
        fValor := removeCar(fValor, ',');

        Self.WriteString(#27 + 'V' + stringOfChar('0', 14 - length(fValor)) + fValor + '$');

        Self.WriteString(#12); // form feed para iniciar a impressão
      finally
        Self.Close;
      end;
    End;
//fim - André Tavares - 28/03/2007 - pendência 24916

  Else
   Begin
    Application.MessageBox('Modelo de impressora não configurado','Atenção',Mb_IconInformation);
    Abort;
   End;
  End;
End;

Procedure TCmImpressoraFiscal.ImprimeVerso(Slinhas :Array of String);
Var
  X, iNumLinhas: Integer;
Begin
  try
    If Not Self.Active Then
      Self.Open;
  except
    raise exception.Create('Não Foi Possível Conectar com a Porta COM');
  end;

  iNumLinhas := High(sLinhas);

  If iNumLinhas > 16 Then iNumLinhas := 16;

  case fNomeImpFiscal of
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

    NSC_201, NSC_218:  //André Tavares - 28/03/2007 - pendência 24916
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

  Else
   Begin
    Application.MessageBox('Modelo de impressora não configurado','Atenção',Mb_IconInformation);
    Abort;
   End;
  End;
End;

Function TCmImpressoraFiscal.ModelosImpressoras:String;
Var
  Lst: TStrings;
Begin
  Lst := TStringList.Create;
  Lst.Add('CHRONOS - ACC 100');
  Lst.Add('CHRONOS - ACC 300');
  Lst.Add('ELGIN - SCHALTER - NSC 2.01');
  //André Tavares - 28/03/2007 - pendência 24916
  Lst.Add('ELGIN - SCHALTER - NSC 2.18');
  Result := Lst.Text;
  Lst.Free;
End;

procedure TCmImpressoraFiscal.SetNomeImpFiscal(const Value: TNomeImpFiscal);
begin
  FNomeImpFiscal := Value;
end;

end.
