unit uCMSimpleTextFileBuilder;

interface

uses classes, uCMTextFileBuilderTypes, Db, DbClient, Mask;

Type
  TRecordMask = class
  private
    fObrigatorio: Boolean;
    fCharToCompleteMask: Char;
    fPosIni: Integer;
    fTamanho: Integer;
    fNome: String;
    fCheckValues: String;
    fMask: String;
    fValorDefault: String;
    fCampoBanco: String;
    fTipoColuna: TTipoTxtColuna;
    fTipoRegistro: TTipoTxtRegistro;
    fTamanhoReal: Boolean;
    procedure SetValorDefault(const Value: string);

  protected

  public
    constructor Create(Nome, CampoBanco, ValorDefault, Mask: String;
      TipoRegistro: TTipoTxtRegistro; TipoColuna: TTipoTxtColuna;
      PosIni, Tamanho: Integer; Obrigatorio: Boolean = True;
      CheckValues: String = ''; CharToCompleteMask: Char = ' '; TamanhoReal: Boolean = False);

    property Nome: String read fNome;
    property CampoBanco: String read fCampoBanco;
    property ValorDefault: String read fValorDefault write SetValorDefault;
    property Mask: String read fMask;
    property CheckValues: String read fCheckValues;
    property CharToCompleteMask: Char read fCharToCompleteMask;
    property TipoRegistro: TTipoTxtRegistro read fTipoRegistro;
    property TipoColuna: TTipoTxtColuna read fTipoColuna;
    property PosIni: Integer read fPosIni;
    property Tamanho: Integer read fTamanho;
    property Obrigatorio: Boolean read fObrigatorio;
    property TamanhoReal: Boolean read fTamanhoReal;
  end;

  TCMSimpleTextFileBuilder = class

  private
    _Arquivo: TStrings;
    _Erros: TStrings;
    _SeparadorDecimal: Char;

    fLayout: string;
    fSeparador: string;
    fFileName: string;
    fSeparadorDecimal: Char;

    procedure DoLog(Msg: String);

  protected

  public
    constructor Create(Layout, FileName: String; Separador: String; SeparadorDecimal: Char = '.');
    destructor Destroy; Override;

    procedure Inicializar(LstErros: TStrings);
    procedure Finalizar;

    procedure BuildRecord(Cds: TClientDataSet; LstRecordMask: TList);
    function TemErro: Boolean;

    procedure SaveToFile(FileName: String = '');

    property Layout: string read fLayout;
    property FileName: string read fFileName;
    property Separador: string read fSeparador;
    property SeparadorDecimal: Char read fSeparadorDecimal; 
  end;

implementation

uses SysUtils, JclStrings, Forms;

{ TRecordMask }

constructor TRecordMask.Create(Nome, CampoBanco, ValorDefault, Mask: String;
      TipoRegistro: TTipoTxtRegistro; TipoColuna: TTipoTxtColuna;
      PosIni, Tamanho: Integer; Obrigatorio: Boolean = True;
      CheckValues: String = ''; CharToCompleteMask: Char = ' '; TamanhoReal: Boolean = False);
begin
  fObrigatorio := Obrigatorio;

  If (Trim(CharToCompleteMask) = '') then
    fCharToCompleteMask := ' '
  else
    fCharToCompleteMask := CharToCompleteMask;

  fPosIni := PosIni;
  fTamanho := Tamanho;
  fNome := Nome;
  fCheckValues := CheckValues;
  fMask := Mask;
  fValorDefault := ValorDefault;
  fCampoBanco := CampoBanco;
  fTipoColuna := TipoColuna;
  fTipoRegistro := TipoRegistro;
  fTamanhoReal:= TamanhoReal;
end;

procedure TRecordMask.SetValorDefault(const Value: string);
begin
  if fValorDefault <> Value then
    fValorDefault:= Value;
end;

{ TCMSimpleTextFileBuilder }
constructor TCMSimpleTextFileBuilder.Create(Layout, FileName: String;
  Separador: String; SeparadorDecimal: Char = '.');
begin
  _Arquivo := TStringList.Create;

  fLayout := Layout;
  fFileName := FileName;
  fSeparador := Separador;
  fSeparadorDecimal := SeparadorDecimal;
end;

destructor TCMSimpleTextFileBuilder.Destroy;
begin
  _Arquivo.Free;
  _Erros := nil;

  inherited;
end;

procedure TCMSimpleTextFileBuilder.DoLog(Msg: String);
begin
  _Erros.Add(Msg);
  Application.ProcessMessages;
end;

procedure TCMSimpleTextFileBuilder.BuildRecord(Cds: TClientDataSet;
  LstRecordMask: TList);
Var
  X: Integer;
  RecordMask: TRecordMask;
  UnformatedValue, FormatedValue, Linha: String;
  Field: TField;

  function GetFieldId: String;
  var
    sCampoBanco: string;
  begin
     if Trim(RecordMask.CampoBanco) = '' then
        sCampoBanco :=  ''
     else
        sCampoBanco := '.' + QuotedStr(RecordMask.CampoBanco);

     Result := QuotedStr(fLayout) + '.' + QuotedStr(RecordMask.Nome) + sCampoBanco;
  end;

begin
  Linha := '';

  for x:= 0 to Pred(LstRecordMask.Count) do
  begin
    RecordMask := TRecordMask(LstRecordMask[x]);

    Field := Cds.FindField(Trim(RecordMask.CampoBanco));

    if Trim(RecordMask.CampoBanco) = '' then
      UnformatedValue := RecordMask.ValorDefault
    else
    begin
      if Field = nil then
        DoLog('O Campo ' + GetFieldId + ' não existe na origem de dados do registro')
      else
        UnformatedValue := Trim(Field.AsString);
    end;

    if RecordMask.Obrigatorio And (Trim(UnformatedValue) = '') then
      DoLog('O Campo ' + GetFieldId + ' é obrigatório e não teve seu valor informado.');

    if (Trim(RecordMask.CheckValues) <> '') And
       (Pos( ('|' + Trim(UnformatedValue) + '|'), Trim(RecordMask.CheckValues)) = 0) then
      DoLog('O Campo ' + GetFieldId + ' não possui um valor válido. Foi informado ' + QuotedStr(Trim(UnformatedValue)) + ' e os valores possíveis são ' + QuotedStr(Trim(RecordMask.CheckValues)));

    if Field <> nil then
    begin
      if Field.IsNull then
        FormatedValue := ''
      else
        if Trim(RecordMask.Mask) = '' then
          FormatedValue := Trim(Field.AsString)
        else
          Case RecordMask.TipoColuna of
            ttcTexto: FormatedValue := FormatMaskText(RecordMask.Mask, Trim(Field.AsString));
            ttcData: FormatedValue := FormatDateTime(RecordMask.Mask, Field.AsDateTime);
            ttcInteiro, ttcDecimal: FormatedValue := FormatFloat(RecordMask.Mask, Field.AsFloat);
          end;
    end
    else
    begin
      FormatedValue := Trim(UnformatedValue);

      if (Trim(RecordMask.Mask) <> '') and (Trim(FormatedValue) <> '') then
        Case RecordMask.TipoColuna of
          ttcTexto: FormatedValue := FormatMaskText(RecordMask.Mask, Trim(FormatedValue));
          ttcData: FormatedValue := FormatDateTime(RecordMask.Mask, StrToDate(Trim(FormatedValue)));
          ttcInteiro, ttcDecimal: FormatedValue := FormatFloat(RecordMask.Mask, StrToFloat(Trim(FormatedValue)));
        end;
      
    end;

    if Trim(FormatedValue) = '' then
      FormatedValue := RecordMask.ValorDefault;

    if (RecordMask.Tamanho > 0) And (RecordMask.Tamanho < Length(FormatedValue)) then
      FormatedValue := Copy(FormatedValue, 1, RecordMask.Tamanho);

    Case RecordMask.TipoColuna of
      ttcTexto, ttcData, ttcValorFixo: begin
                                         if RecordMask.TamanhoReal then
                                           FormatedValue := Copy(FormatedValue, 1, RecordMask.Tamanho)
                                         else
                                           FormatedValue := StrPadRight(FormatedValue, RecordMask.Tamanho, RecordMask.CharToCompleteMask);
                                       end;
    else
      if RecordMask.TamanhoReal then
        FormatedValue :=  Copy(FormatedValue,1,RecordMask.Tamanho)
      else
        FormatedValue :=  StrPadLeft(FormatedValue, RecordMask.Tamanho, RecordMask.CharToCompleteMask);
    end;

    Linha := Linha + FormatedValue + fSeparador;
  end;

  if Trim(fSeparador) <> '' then
    Linha := Copy(Linha, 1, Length(Linha) - 1);

  _Arquivo.add(Linha);
end;

procedure TCMSimpleTextFileBuilder.Inicializar(LstErros: TStrings);
begin
  _Arquivo.Clear;

  _Erros := LstErros;
  _Erros.Clear;

  _SeparadorDecimal := DecimalSeparator;
  DecimalSeparator := fSeparadorDecimal;
end;

procedure TCMSimpleTextFileBuilder.SaveToFile(FileName: String);
Var
  sFileName: String;
begin
  if (Trim(FileName) <> '') then
    sFileName := FileName
  else
    sFileName := fFileName;

  if (Trim(sFileName) = '') then
    raise Exception.Create('Não foi informado o nome do Arquivo.')
  else
    _Arquivo.SaveToFile(sFileName);
end;

function TCMSimpleTextFileBuilder.TemErro: Boolean;
begin
  result := (_Erros.Count > 0)
end;

procedure TCMSimpleTextFileBuilder.Finalizar;
begin
  DecimalSeparator := _SeparadorDecimal;
end;

end.
