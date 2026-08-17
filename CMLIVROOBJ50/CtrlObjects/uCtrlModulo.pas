unit uCtrlModulo;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,uDiasUteis, Forms, FileCtrl, uCMFileUtils;
  Type
    TCtrlModulo = Class(TCmControlObject)

    private
    cdsGeral : TclientDataSet;

    fExisteParametros: Boolean;
    FLancaBaixaFloat: Boolean;
    fObrigaTrdxImposto: Boolean;
    fObrigaTrdxCCxConta: Boolean;
    FExcluiContab: Boolean;
    FCorrigeDocAuto: Boolean;
    FExcluiPlanil: Boolean;
    FTipoBordero: Boolean;
    FEstornaFinanc: Boolean;
    FEmiteLancaBaixa: Boolean;
    fValidaCCBaixa: Boolean;
    FControlaEmisCheque: Boolean;
    FObrigaFormaPagto: Boolean;
    FIdReports: Integer;
    FUnidNegoc: Integer;
    FIdTipoCliAdianto: Integer;
    FOrigemCm: Integer;
    FRamoFornAdianto: Integer;
    FCodAForne: Integer;
    FIdTipoProcRad: Integer;
    FUsuario: Integer;
    FIndiceTipoBordero: Integer;
    fNumLancto: Integer;
    FModeloImpressora: Integer;
    FEmpresaProp: Integer;
    fCodDocCPMF: LongInt;
    fCodDocumento: LongInt;
    fSubContaNaoIdent: LongInt;
    fVlrRetencao: Real;
    fIdForCli: Real;
    fValorZero: Real;
    fIdForCliIni: Real;
    fPpReports: String;
    FsIntegraVHL: string;
    fFormEventos: String;
    FPrevEfet: string;
    FSisCodOrigem: string;
    FImpressoraDefault: string;
    FVersao: string;
    FLancaFinan: string;
    FHistPadFinan: string;
    FLoteBordero: string;
    fFormParam: String;
    FCodPortForma: string;
    fContaNaoIdentificado: String;
    fCodTipRecDes: String;
    fNomeReport: String;
    protected
      procedure DoChangeDataBase; Override;

    public
      sMascaraPlano,
      sMascaraDesemb,sMascDocFis,sMascDocJur,
      sLancFinanc,sEstorna,ObrigaAbc,ObrigaCrespon,sIntegraContab: String;
      iPlano : Integer;
      UnidNegoc : Integer;
      sRecPag:String;
      bTipoOper:Boolean;
      Constructor Create; Override;
      Destructor Destroy; Override;

      property  ValorZero           :Real    read fValorZero            write fValorZero;
      property  SubContaNaoIdent    :LongInt read fSubContaNaoIdent     write fSubContaNaoIdent;
      property  ImpressoraDefault   :string  read FImpressoraDefault    write FImpressoraDefault;
      property  Versao              :string  read FVersao               write FVersao;
      property  HistPadFinan        :string  read FHistPadFinan         write FHistPadFinan;
      property  SisCodOrigem        :string  read FSisCodOrigem         write FSisCodOrigem;
      property  LoteBordero         :string  read FLoteBordero          write FLoteBordero;
      property  sIntegraVHL         :string  read FsIntegraVHL          write FsIntegraVHL;
      property  PrevEfet            :string  read FPrevEfet             write FPrevEfet;
      property  CodPortForma        :string  read FCodPortForma         write FCodPortForma;
      property  LancaFinan          :string  read FLancaFinan           write FLancaFinan;
      property  ContaNaoIdentificado:String  read fContaNaoIdentificado Write fContaNaoIdentificado;
      property  ModeloImpressora    :Integer read FModeloImpressora     write FModeloImpressora;
      property  EmpresaProp         :Integer read FEmpresaProp          write FEmpresaProp;
      property  Usuario             :Integer read FUsuario              write FUsuario;
      property  IdTipoCliAdianto    :Integer read FIdTipoCliAdianto     write FIdTipoCliAdianto;
      property  UnidNegocc          :Integer read FUnidNegoc            write FUnidNegoc;
      property  CodAForne           :Integer read FCodAForne            write FCodAForne;
      property  IndiceTipoBordero   :Integer read FIndiceTipoBordero    write FIndiceTipoBordero;
      property  RamoFornAdianto     :Integer read FRamoFornAdianto      write FRamoFornAdianto;
      property  TipoBordero         :Boolean read FTipoBordero          write FTipoBordero;
      property  EstornaFinanc       :Boolean read FEstornaFinanc        write FEstornaFinanc;
      property  EmiteLancaBaixa     :Boolean read FEmiteLancaBaixa      write FEmiteLancaBaixa;
      property  ObrigaFormaPagto    :Boolean read FObrigaFormaPagto     write FObrigaFormaPagto;
      property  CorrigeDocAuto      :Boolean read FCorrigeDocAuto       write FCorrigeDocAuto;
      property  ExcluiContab        :Boolean read FExcluiContab         write FExcluiContab;
      property  ControlaEmisCheque  :Boolean read FControlaEmisCheque   write FControlaEmisCheque;
      property  LancaBaixaFloat     :Boolean read FLancaBaixaFloat      Write FLancaBaixaFloat;
      property  ExcluiPlanil        :Boolean read FExcluiPlanil         Write FExcluiPlanil;
      property  ExisteParametros    :Boolean read fExisteParametros     Write fExisteParametros;
      property  IdTipoProcRad       :Integer read FIdTipoProcRad        Write FIdTipoProcRad;
      property  NumLancto           :Integer read fNumLancto            Write fNumLancto;
      property  VlrRetencao         :Real    read fVlrRetencao          Write fVlrRetencao;
      property  IdForCli            :Real    read fIdForCli             Write fIdForCli;
      property  IdForCliIni         :Real    read fIdForCliIni          Write fIdForCliIni;
      property  IdReports           :Integer read FIdReports            Write FIdReports;
      property  OrigemCm            :Integer read FOrigemCm             Write FOrigemCm;
      property  NomeReport          :String  read fNomeReport           write fNomeReport;
      property  FormEventos         :String  read fFormEventos          write fFormEventos;
      property  FormParam           :String  read fFormParam            write fFormParam;
      property  PpReports           :String  read fPpReports            write fPpReports;
      property  CodDocumento        :LongInt read fCodDocumento         write fCodDocumento;
      property  ObrigaTrdxCCxConta  :Boolean read fObrigaTrdxCCxConta   Write fObrigaTrdxCCxConta;
      property  ObrigaTrdxImposto   :Boolean read fObrigaTrdxImposto    Write fObrigaTrdxImposto;
      property  CodTipRecDes        :String  read fCodTipRecDes         Write fCodTipRecDes;
      property  CodDocCPMF          :LongInt read fCodDocCPMF           write fCodDocCPMF;
      property  ValidaCCBaixa       :Boolean read fValidaCCBaixa        write fValidaCCBaixa;
      {Deleta Arquivos}
      Procedure DeletaArquivos(sExtensao:String;FormBase: TForm);
      function  ArredondaParaComparar(rValor:Real;iNumDecimais: Integer):Real;
      function  ContabilizaIdModulo(sOper: string; iCodDoc: LongInt): boolean;
      function  CalcProxDiaSemana(IdPessoa : LongInt; dDataRef : TDateTime; iDiaDesejado : Integer; bDiaUtil : Boolean) : TDateTime;
      function  CalcDataIni(dDataRef : TDateTime) : TDateTime;
      function  CalcDataFim(dDataRef : TDateTime) : TDateTime;


    protected

    End;

implementation

Uses uString,
     uMensErro, uRad;


{ TCtrlModulo }

function TCtrlModulo.ArredondaParaComparar(rValor: Real;
                                           iNumDecimais: Integer): Real;

Var
  sMascara, sAuxValor:String;
Begin
    If iNumDecimais < 0 then
       sMascara := '%17.0f'
    Else
       sMascara := '%17.' + IntToStr(iNumDecimais) + 'f';

    sAuxValor := trim(Format(sMascara,[rValor]));

    while Pos('.',sAuxValor) <> 0 Do
             Delete(sAuxValor,Pos('.',sAuxValor),1);

    Result := StrToFloat(sAuxValor)
end;




function TCtrlModulo.CalcDataFim(dDataRef: TDateTime): TDateTime;
var iDiaSemana : Integer;
begin
  inherited;
  iDiaSemana := DayOfWeek(dDataRef);
  Result     := dDataRef - iDiaSemana;
end;

function TCtrlModulo.CalcDataIni(dDataRef: TDateTime): TDateTime;
var iDiaSemana : Integer;
begin
  inherited;
  iDiaSemana := DayOfWeek(dDataRef);
  Result     := dDataRef - iDiaSemana - 5;
end;

function TCtrlModulo.CalcProxDiaSemana(IdPessoa : integer; dDataRef: TDateTime;
                                       iDiaDesejado: Integer; bDiaUtil: Boolean): TDateTime;
Var
  Ssql : string;
  iNumDias, iDiaSemana : Integer;
  dDataIni, dDataFim   : TDateTime;
begin
  inherited;
  iDiaSemana := DayOfWeek(dDataRef);
  dDataIni := dDataRef + (1 - iDiaSemana);
  dDataFim := dDataIni + iDiaDesejado;
  Result   := dDataFim;
  if bDiaUtil then
    Begin
      Ssql := 'SELECT ES.IDPAIS, ES.CODESTADO, EP.IDCIDADES           '+
              '  FROM PESSOA P, ENDPESS EP, CIDADES C, ESTADO ES,     '+
              '       EMPRESAPROP E                                   '+
              ' WHERE (E.IDPESSOA = '+IntToStr(IdPessoa)+') '+
              '   AND (P.IDPESSOA = E.IDPESSOA) '+
              '   AND (P.IDENDCOMERCIAL = EP.IDENDERECO) '+
              '   AND (EP.IDCIDADES = C.IDCIDADES) '+
              '   AND (C.IDESTADO = ES.IDESTADO)';
      cdsGeral.data := GetDataPacket(Ssql);
      //
      iNumDias := DiasUteis.ContaDiasNaoUteis((dDataIni+1),dDataFim,cdsGeral.FieldByName('IDCIDADES').AsInteger,
                  cdsGeral.FieldByName('IDPAIS').AsInteger, cdsGeral.FieldByName('CODESTADO').AsString,True,
                  True,False);
      Result   := dDataFim + iNumDias;
    end;
end;

function TCtrlModulo.ContabilizaIdModulo(sOper: string;
                                         iCodDoc: Integer): boolean;
Var
  Ssql : string;
begin
  Result := True;
  if Trim(sOper) = '5' then
    Begin
      Ssql := 'SELECT IDMODULO FROM DOCUMENTO WHERE CODDOCUMENTO = '+
                IntToStr(iCodDoc);
      cdsGeral.data := GetDataPacket(Ssql);
      if cdsGeral.FieldByName('IDMODULO').AsInteger = 127 then
        Result := False;
    end;
end;

constructor TCtrlModulo.Create;
begin
  inherited;
  cdsGeral := TClientDataSet.Create(nil);
  fValorZero            := 0;
  fIdReports            := 0;
  fOrigemCm             := 0;
  fCodDocumento         := 0;
  fNomeReport           := '';
  fFormEventos          := '';
  fFormParam            := '';
  fPpReports            := '';
  fCodTipRecDes         := '';
  fExisteParametros     := False;
  fObrigaTrdxCCxConta   := False;
  fObrigaTrdxImposto    := False;
  fCodDocCPMF           := 0;
  fValidaCCBaixa        := False;
end;

procedure TCtrlModulo.DeletaArquivos(sExtensao: String; FormBase: TForm);
Var
    X:Integer;
    ListaArqTemp: TFileListBox;
Begin
    ListaArqTemp := TFileListBox.Create(Application);
    try
     ListaArqTemp.Visible := False;
     ListaArqTemp.Parent := FormBase;
     ListaArqTemp.Mask := '*.' + sExtensao;
     ListaArqTemp.Directory := Copy(cmGetTempPath,1,Length(cmGetTempPath));
     ListaArqTemp.Refresh;
     For X:= 0 To ListaArqTemp.Items.Count - 1 Do
        DeleteFile(PChar(cmGetTempPath + ListaArqTemp.Items[x]));
    Finally
     ListaArqTemp.Free;
    End;
end;

destructor TCtrlModulo.Destroy;
begin
  inherited;
  cdsGeral.free;
end;

procedure TCtrlModulo.DoChangeDataBase;
begin
  inherited;

end;


end.
