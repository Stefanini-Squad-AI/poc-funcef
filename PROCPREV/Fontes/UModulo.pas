(*******************************************************************************
 25/02/99
  Criação da Propriedade IdTipoCliAdianto para indicação do Tipo de CLiente Para
  Adiantamento;
  Criação do Método Modulo.BuscaParamCap;
 22/03/1999 - 02.06.01
 Criação e inicialização da propriedade HistPadFinan;

 (...)

 13/10/1999 - 2.13.14 (R)
   Impementação da propriedade ContaNaoIdentificado que inicializada pelo método
   BuscaParamCap com a conta contábil dos lançamentos não identificados definida
   no ParamFinanc.
 20/12/1999 - 2.13.16
   Inclusao da propriedade IdTipoProcRad que indentifica a existencia de um
   processo de controle de pagamentos
 04/01/2000 - 2.15.01
   Implementação do método ExisteRegularizacao onde é verificado se ocorreu a
   regularização de um adiandamento ou se um documento possui regularização
   através do parâmetro código do documento;
 15/05/200 - Alterações Funcef
   Criação das propriedades...
   IdReports           :integer
   OrigemCm            :integer
   NomeReport          :string
   FormEventos         :string
   FormParam           :string
   PpReports           :string
   CodDocumento        :LongInt
   ...para contemplar a implementação do Parâmetro do Sistema "Relatório para Espelho de Documento";
  10/10/2000
   Inclusão do método ValidaDataPagtoRecto;
*******************************************************************************)

unit uModulo;

interface

Uses
  SysUtils, Forms, Controls,MontaSelect,StdCtrls, Wwdbigrd, Wwdbgrid, dBaseDados,
  WwQuery, Classes, Windows, filectrl, uIntegraBack, ppCtrls, Dialogs;

type
  TModulo = Class
  private
    FVersao,
    FSisCodOrigem,
    FPrevEfet,
    FLoteBordero,
    FHistPadFinan,
    FsIntegraVHL,
    FImpressoraDefault,
    FCodPortForma,
    FLancaFinan,
    FContaNaoIdentificado,
    FCodTipRecDes,
    FFormEventos,
    FFormParam,
    FPpReports,
    FNomeReport: string;
    FLancaBaixaFloat,
    FExcluiPlanil,
    FTipoBordero,
    FEmiteLancaBaixa,
    FEstornaFinanc,
    FObrigaFormaPagto,
    FCorrigeDocAuto,
    FExcluiContab,
    FCadastraModeloRelat,
    FExisteParametros,
    FObrigaTrdxCCxConta,
    FObrigaTrdxImposto,
    FValidaCCBaixa,
    FControlaEmisCheque: boolean;
    FEmpresaProp,
    FCodAForne,
    FUsuario,
    FIdTipoCliAdianto,
    FUnidNegoc,
    FIndiceTipoBordero,
    FModeloImpressora,
    FIdTipoProcRad,
    FNumLancto,
    FIdReports,
    FOrigemCm,
    FRamoFornAdianto: integer;
    FCodDocCPMF,
    FCodDocumento,
    FSubContaNaoIdent: LongInt;
    FVlrRetencao,
    FIdForCli,
    FIdForCliIni,
    FValorZero: real;
  public
    constructor Create;
    //procedure BuscaParamCap(iEmpresa: integer);
    procedure DeletaArquivos(sExtensao:string;FormBase: TForm);
    function  GravaNumFatura(iCodDocumento, iNumLancto :LongInt; sNumFatura :string; cTipoDoc: Char; sMascara: string) :boolean;
    //function  DlgData(sCaption,sFrase: string; dDataIni: TdateTime):string;
    function  ArredondaParaComparar(rValor:Real;iNumDecimais: integer):Real;
    function  VerificaLinhaGrid(qry:TwwQuery;iTagChave, iTagVazio:integer;sTabelaMensagem:string;bPermiteChaveVazia:boolean):boolean;
    //function  ExisteRegularizacao(iCodDocumento: LOngInt):boolean;
    //function  ProcessoRadLiberado(NumLote: LongInt): boolean;
    function  ValidaDataPagtoRecto(iCodDocumento :LongInt; DataPagto:string): boolean;
    function  ContabilizaIdModulo(sOper: string; iCodDoc: LongInt): boolean;
    function  StatusIsAtivo(IdPessoa: integer): boolean;

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
    property  ContaNaoIdentificado:string  read fContaNaoIdentificado write fContaNaoIdentificado;
    property  ModeloImpressora    :integer read FModeloImpressora     write FModeloImpressora;
    property  EmpresaProp         :integer read FEmpresaProp          write FEmpresaProp;
    property  Usuario             :integer read FUsuario              write FUsuario;
    property  IdTipoCliAdianto    :integer read FIdTipoCliAdianto     write FIdTipoCliAdianto;
    property  UnidNegoc           :integer read FUnidNegoc            write FUnidNegoc;
    property  CodAForne           :integer read FCodAForne            write FCodAForne;
    property  IndiceTipoBordero   :integer read FIndiceTipoBordero    write FIndiceTipoBordero;
    property  RamoFornAdianto     :integer read FRamoFornAdianto      write FRamoFornAdianto;
    property  TipoBordero         :boolean read FTipoBordero          write FTipoBordero;
    property  EstornaFinanc       :boolean read FEstornaFinanc        write FEstornaFinanc;
    property  EmiteLancaBaixa     :boolean read FEmiteLancaBaixa      write FEmiteLancaBaixa;
    property  ObrigaFormaPagto    :boolean read FObrigaFormaPagto     write FObrigaFormaPagto;
    property  CorrigeDocAuto      :boolean read FCorrigeDocAuto       write FCorrigeDocAuto;
    property  ExcluiContab        :boolean read FExcluiContab         write FExcluiContab;
    property  ControlaEmisCheque  :boolean read FControlaEmisCheque   write FControlaEmisCheque;
    property  LancaBaixaFloat     :boolean read FLancaBaixaFloat      write FLancaBaixaFloat;
    property  ExcluiPlanil        :boolean read FExcluiPlanil         write FExcluiPlanil;
    property  CadastraModeloRelat :boolean read FCadastraModeloRelat  write FCadastraModeloRelat;
    property  ExisteParametros    :boolean read fExisteParametros     write fExisteParametros;
    property  IdTipoProcRad       :integer read FIdTipoProcRad        write FIdTipoProcRad;
    property  NumLancto           :integer read fNumLancto            write fNumLancto;
    property  VlrRetencao         :Real    read fVlrRetencao          write fVlrRetencao;
    property  IdForCli            :Real    read fIdForCli             write fIdForCli;
    property  IdForCliIni         :Real    read fIdForCliIni          write fIdForCliIni;
    property  IdReports           :integer read FIdReports            write FIdReports;
    property  OrigemCm            :integer read FOrigemCm             write FOrigemCm;
    property  NomeReport          :string  read fNomeReport           write fNomeReport;
    property  FormEventos         :string  read fFormEventos          write fFormEventos;
    property  FormParam           :string  read fFormParam            write fFormParam;
    property  PpReports           :string  read fPpReports            write fPpReports;
    property  CodDocumento        :LongInt read fCodDocumento         write fCodDocumento;
    property  ObrigaTrdxCCxConta  :boolean read fObrigaTrdxCCxConta   write fObrigaTrdxCCxConta;
    property  ObrigaTrdxImposto   :boolean read fObrigaTrdxImposto    write fObrigaTrdxImposto;
    property  CodTipRecDes        :string  read fCodTipRecDes         write fCodTipRecDes;
    property  CodDocCPMF          :LongInt read fCodDocCPMF           write fCodDocCPMF;
    property  ValidaCCBaixa       :boolean read fValidaCCBaixa        write fValidaCCBaixa;
  end;

var
  Modulo: TModulo;

implementation

uses uCMFileUtils, uDataBase, uString, uSistema, uMensErro, uRad, uFuncaoGeral;

constructor TModulo.Create;
begin
  Inherited Create;
  fValorZero            := 0;
  fIdReports            := 0;
  fOrigemCm             := 0;
  fCodDocumento         := 0;
  fNomeReport           := '';
  fFormEventos          := '';
  fFormParam            := '';
  fPpReports            := '';
  fCodTipRecDes         := '';
  fExisteParametros     := false;
  fObrigaTrdxCCxConta   := false;
  fObrigaTrdxImposto    := false;
  fCodDocCPMF           := 0;
  fValidaCCBaixa        := false;
end;

function TModulo.ContabilizaIdModulo(sOper:string; iCodDoc:LongInt): boolean;
begin
  Result := true;
  if (Trim(sOper) = '5') then
    if FazQuery(dtmBaseDados.qry,
                'SELECT IDMODULO FROM DOCUMENTO WHERE CODDOCUMENTO = '+IntToStr(iCodDoc)) then
      if(dtmBaseDados.qry.FieldByName('IDMODULO').asInteger = 127) then
        Result := false;
end;

function TModulo.ArredondaParaComparar(rValor:Real;iNumDecimais: integer):Real;
var
  sMascara, sAuxValor: string;
begin
  if (iNumDecimais < 0) then
    sMascara := '%17.0f'
  else
    sMascara := '%17.' + IntToStr(iNumDecimais) + 'f';

  sAuxValor := trim(Format(sMascara,[rValor]));

  while (Pos('.',sAuxValor) <> 0) do
    Delete(sAuxValor,Pos('.',sAuxValor),1);

  Result := StrToFloat(sAuxValor);
end;

{function TModulo.DlgData(sCaption,sFrase: string; dDataIni: TdateTime):string;
var sData: string;
begin
   sData := '';
   try
     Application.CreateForm(TFrmIndicaData,FrmIndicaData);
     FrmIndicaData.Caption := sCaption;
     FrmIndicaData.GpData.Caption := ' ' + sFrase + ' ';
     FrmIndicaData.DtData.Date := dDataIni;
     if (FrmIndicaData.ShowModal = mrOk) then
        sData := DateToStr(FrmIndicaData.DtData.Date);
   finally
     FrmIndicaData.Free;
     Result := sData;
   end;
end;

procedure TModulo.BuscaParamCap(iEmpresa: integer);
var
  iSistema: integer;
  LblRelats: TppLabel;
begin
    if FazQuery(DtmBaseDados.qry,
                'SELECT P.IMPGENERICA,P.IDTIPOCLIADIANTO, P.CODADFORNE, P.HISTPADFINAN, P.IDRAMOFORNECEDOR, ' +
                'P.IDIMPRESSORA, P.FLGESTEXCFINANC, P.FLGEMITELANCBAIX, P.FLGOBRIGFORMAPGTO, P.FLGCOMPLTIPOFAT, P.MASCARANODOCUM, ' +
                'P.FLGCORRIGEDOCAUTO, P.FLGEXCLUICONTAB, P.FLGCONTROLACHEQUE, P.FLGLANCAFLOAT, P.FLGEXCLUIPLANIL, R.NAME, ' +
                'R.FORMEVENTOS, R.FORMPARAMREL, R.PPREPORT, R.IDREPORTS, R.ORIGEMCM, P.FLGTRDXCCXCONTA, P.FLGTRDXIMPOSTOS, ' +
                'P.CODTIPDOCCPMF, P.FLGVALIDACCBAIXA ' +
                'FROM PARAMCAP P, REPORTS R WHERE IDPESSOA = ' + IntToStr(iEmpresa) + ' and RECPAG = ''' + IntegraBack.RecPag + ''' and P.IDREPORTS = R.IDREPORTS(+) and P.ORIGEMCM = R.ORIGEMCM(+) ') then
    begin
       if Copy(DtmBaseDados.qry.FieldByName('IMPGENERICA').asString,Length(DtmBaseDados.qry.FieldByName('IMPGENERICA').asString),1) = '\' then
          FImpressoraDefault := Copy(DtmBaseDados.qry.FieldByName('IMPGENERICA').asString,1,Length(DtmBaseDados.qry.FieldByName('IMPGENERICA').asString)-1)
       else
          fImpressoraDefault := DtmBaseDados.qry.FieldByName('IMPGENERICA').asString;

       FIdTipocliAdianto    := DtmBaseDados.qry.FieldByName('IDTIPOCLIADIANTO').asInteger;
       FCodAForne           := DtmBaseDados.qry.FieldByName('CODADFORNE').asInteger;
       FHistPadFinan        := DtmBaseDados.qry.FieldByName('HISTPADFINAN').asString;
       FModeloImpressora    := DtmBaseDados.qry.FieldByName('IDIMPRESSORA').asInteger;
       FEstornaFinanc       := (DtmBaseDados.qry.FieldByName('FLGESTEXCFINANC').asString <> 'X');
       FEmiteLancaBaixa     := (DtmBaseDados.qry.FieldByName('FLGEMITELANCBAIX').asString = 'S');
       FObrigaFormaPagto    := (DtmBaseDados.qry.FieldByName('FLGOBRIGFORMAPGTO').asString = 'S');
       FCorrigeDocAuto      := (DtmBaseDados.qry.FieldByName('FLGCORRIGEDOCAUTO').asString = 'S');
       FExcluiContab        := (DtmBaseDados.qry.FieldByName('FLGEXCLUICONTAB').asString = 'S');
       FControlaEmisCheque  := (DtmBaseDados.qry.FieldByName('FLGCONTROLACHEQUE').asString = 'S');
       FRamoFornAdianto     := DtmBaseDados.qry.FieldByName('IDRAMOFORNECEDOR').asInteger;
       FLancaBaixaFloat     := (DtmBaseDados.qry.FieldByName('FLGLANCAFLOAT').asString = 'S');
       FExcluiPlanil        := (DtmBaseDados.qry.FieldByName('FLGEXCLUIPLANIL').asString = 'S');
       fIdReports           := DtmBaseDados.qry.FieldByName('IDREPORTS').asInteger;
       fOrigemCm            := DtmBaseDados.qry.FieldByName('ORIGEMCM').asInteger;
       fNomeReport          := DtmBaseDados.qry.FieldByName('NAME').asString ;
       fFormEventos         := DtmBaseDados.qry.FieldByName('FORMEVENTOS').asString ;
       fFormParam           := DtmBaseDados.qry.FieldByName('FORMPARAMREL').asString ;
       fPpReports           := DtmBaseDados.qry.FieldByName('PPREPORT').asString ;
       fObrigaTrdxCCxConta  := (DtmBaseDados.qry.FieldByName('FLGTRDXCCXCONTA').asString = 'S');
       fObrigaTrdxImposto   := (DtmBaseDados.qry.FieldByName('FLGTRDXIMPOSTOS').asString = 'S');
       fCodDocCPMF          := DtmBaseDados.qry.FieldByName('CODTIPDOCCPMF').asInteger;
       fValidaCCBaixa       := (DtmBaseDados.qry.FieldByName('FLGVALIDACCBAIXA').asString = 'S');

       if FazQuery(DtmBaseDados.qry,'SELECT CONTALANCNAOIDENT, SUBCONTANAOIDENT FROM PARAMFINANC WHERE IDPESSOA = ' + IntToStr(iEmpresa)) then
       begin
          fContaNaoIdentificado := DtmBaseDados.qry.FieldByName('CONTALANCNAOIDENT').asString;
          fSubContaNaoIdent     := DtmBaseDados.qry.FieldByName('SUBCONTANAOIDENT').asInteger;
       end
       else
       begin
          fContaNaoIdentificado := '';
          fSubContaNaoIdent     := 0;
       end;

       fExisteParametros     := true;
    end
    else
    begin
       FImpressoraDefault    := '';
       FIdTipoCliAdianto     := 0;
       FCodAForne            := 0;
       FHistPadFinan         := '';
       FModeloImpressora     := -1;
       FEstornaFinanc        := true;
       FEmiteLancaBaixa      := false;
       FObrigaFormaPagto     := false;
       FCorrigeDocAuto       := false;
       FExcluiContab         := false;
       FControlaEmisCheque   := false;
       FRamoFornAdianto      := -1;
       FLancaBaixaFloat      := false;
       fContaNaoIdentificado := '';
       FExcluiPlanil         := false;
       fSubContaNaoIdent     := 0;
       fExisteParametros     := false;
       fIdReports            := 0;
       fOrigemCm             := 0;
       fNomeReport           := '';
       fFormEventos          := '';
       fFormParam            := '';
       fPpReports            := '';
       fObrigaTrdxCCxConta   := false;
       fObrigaTrdxImposto    := false;
       fCodDocCPMF           := 0;
       fValidaCCBaixa        := false;
    end;

    if IntegraBack.RecPag = 'P' then
       iSistema := 3
    else
       iSistema := 4;

    if FazQuery(DtmBaseDados.qry,
       'SELECT NOMECOMPO,VALOR FROM PARAMRELATS WHERE (IDMODULO = '
       + IntToStr(iSistema)  + ') and (IDPESSOA = '
       + IntToStr(iEmpresa) + ')' ) then
       begin
         while not DtmBaseDados.qry.Eof do
         begin
           try
            LblRelats := (DtmRelatoriosCapCar.FindComponent(DtmBaseDados.qry.FieldByName('NOMECOMPO').asString) As TppLabel);
            if LblRelats = nil then
               LblRelats := (DtmRelatoriosCapCar2.FindComponent(DtmBaseDados.qry.FieldByName('NOMECOMPO').asString) As TppLabel);

            if LblRelats <> nil then
               LblRelats.Caption := DtmBaseDados.qry.FieldByName('VALOR').asString;
           finally
            DtmBaseDados.qry.Next;
           end;
         end;
       end;

       if (Sistema.UsaRad) and (FazQuery(DtmBaseDados.qry,'SELECT IDTIPOPROCESSO FROM RADTIPOPROCESSO WHERE IDREFERENCIA = 6')) then
          FIdTipoProcRad := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger
       else
          FIdTipoProcRad := 0;
end;
}
function TModulo.VerificaLinhaGrid(qry:TwwQuery; iTagChave,iTagVazio:integer;
  sTabelaMensagem:string; bPermiteChaveVazia:boolean): boolean;
var
  X: integer;
  sChave: string;
  ListaChave: TStrings;
begin
  ListaChave := TStringList.Create;

  if (qry.IsEmpty) then
  begin
    Result := true;
    Exit;
  end;

  try
    qry.First;
    while not(qry.EOF) do
    begin
      sChave := '';
      for X:=0 to qry.FieldCount-1 do
        if (qry.Fields[X].Tag = iTagChave) or (qry.Fields[X].Tag = iTagVazio) then
        begin
          sChave := sChave + Trim(qry.Fields[X].asString);
          if not(bPermiteChaveVazia) and (qry.Fields[X].Tag <> iTagVazio) then
          begin
            if (qry.Fields[X].IsNull) then
            begin
              Application.MessageBox(PChar('O Campo ' + qry.Fields[X].DisPlayLabel + ' do Cadastro de ' + sTabelaMensagem + ' não foi informado'),'Atenção',Mb_IconInformation);
              Result := false;
              Exit;
            end;
          end;
        end;

      if (ListaChave.IndexOf(sChave) <> -1) then
      begin
        Application.MessageBox(PChar('O Cadastro de ' + sTabelaMensagem + ' contém um registro repetido'),'Atenção',Mb_IconInformation);
        Result := false;
        Exit;
      end
      else
      if (sChave = '') then
      begin
        Application.MessageBox(Pchar('O Cadastro de ' + sTabelaMensagem + ' contém um registro não preenchido'),'Atenção',Mb_IconInformation);
        Result := false;
        Exit;
      end
      else
        ListaChave.Add(sChave);

      qry.Next;
    end;
    qry.First;
    Result := true;
  finally
    ListaChave.Free;
  end;
end;

Procedure TModulo.DeletaArquivos(sExtensao:string;FormBase: TForm);
var
  X: integer;
  ListaArqTemp: TFileListBox;
begin
  ListaArqTemp := TFileListBox.Create(Application);
  try
    ListaArqTemp.Visible   := false;
    ListaArqTemp.Parent    := FormBase;
    ListaArqTemp.Mask      := '*.' + sExtensao;
    ListaArqTemp.Directory := Copy(cmGetTempPath,1,Length(cmGetTempPath));
    ListaArqTemp.Refresh;

    for X:= 0 to ListaArqTemp.Items.Count-1 do
      DeleteFile(PChar(cmGetTempPath + ListaArqTemp.Items[x]));
  finally
    ListaArqTemp.Free;
  end;
end;

{function TModulo.ExisteRegularizacao(iCodDocumento: LOngInt):boolean;
begin
  with DtmRelatoriosCapCar2 do
  begin
    Result := true;
    if qryTestaRegAdianto.Active then qryTestaRegAdianto.Close;
    if not qryTestaRegAdianto.Prepared then qryTestaRegAdianto.Prepare;
    qryTestaRegAdianto.ParamByName('CODDOCUMENTO').asInteger := iCodDocumento;
    qryTestaRegAdianto.ParamByName('OPERACAO').asString := '17';
    qryTestaRegAdianto.Open;
    if not qryTestaRegAdianto.IsEmpty then
       Msgdlg( 'Foi regularizado um adiantamento com este documento ou ele consta num lote onde existiu tal regularização, Não é possível excluir/estornar a baixa' ,'Aviso',mtwarning,[mbOk],0)
    else
    begin
       if qryTestaRegAdianto.Active then qryTestaRegAdianto.Close;
       if not qryTestaRegAdianto.Prepared then qryTestaRegAdianto.Prepare;
       qryTestaRegAdianto.ParamByName('CODDOCUMENTO').asInteger := iCodDocumento;
       qryTestaRegAdianto.ParamByName('OPERACAO').asString := '16';
       qryTestaRegAdianto.Open;
       if not qryTestaRegAdianto.IsEmpty then
          Msgdlg( 'Este lançamento corresponde a um adiantamento já regularizado ou ele consta num lote onde existiu tal regularização, Não é possível excluir/estornar a baixa' ,'Aviso',mtwarning,[mbOk],0)
       else
         Result := false;
    end;
  end;
end;

function TModulo.ProcessoRadLiberado(NumLote: LongInt): boolean;
var
  RadLote :Trad;
begin
  with DtmRelatoriosCapcar2 do
  begin
    RadLote      := TRad.Create;
    if Sistema.UsaRAD then
    begin
      if qryTestaRad.Active       then qryTestaRad.Close;
      if not qryTestaRad.Prepared then qryTestaRad.Prepare;
      qryTestaRad.ParamByName('NUMLOTE').asFloat := NumLote;
      qryTestaRad.Open;
      if not qryTestaRadIDPROCESSO.IsNull then
      begin
        RadLote.IdProcesso   := qryTestaRadIDPROCESSO.asInteger;
        Result               := RadLote.SituacaoProcesso;
        if not Result then
           Msgdlg('O Lote ' + IntToStr(NumLote) + ' não está autorizado para emissão','Aviso',mtinformation,[mbOk],0);
      end
      else
        Result := true;
    end
    else
      Result := true;
    if qryTestaRad.Active then qryTestaRad.Close;
    RadLote.Free;
  end;
end;}

function TModulo.GravaNumFatura(iCodDocumento,iNumLancto:LongInt; sNumFatura:string;
  cTipoDoc:char; sMascara:string): boolean;
var
  wAno, wMes, wDia: word;
  iAux, X, iPosFin: integer;
  sValSeq, sAuxNumFatura, sSql, Ano, Mes, Dia: string;
begin
  StartTransacao;
  sAuxNumFatura := sNumFatura;

  if (sMascara <> '') then
  begin
    sAuxNumFatura := sMascara;
    DecodeDate(Date,wAno,wMes,wDia);

    Ano := IntToStr(wAno);
    Mes := IntToStr(wMes);
    Dia := IntToStr(wDia);

    if (Length(Dia) = 1) then
      Dia := '0' + Dia;

    if (Length(Mes) = 1) then
      Mes := '0' + Mes;


    if (Length(Mes) = 1) then
      Mes := '0' + Mes;

    if (Length(Dia) = 1) then
      Mes := '0' + Dia;

    iAux := Pos('DD',upperCase(sAuxNumFatura));
    if (iAux <> 0) then
    begin
      sAuxNumFatura[iAux]     := Dia[1];
      sAuxNumFatura[iAux + 1] := Dia[2];
    end;

    iAux := Pos('MM',upperCase(sAuxNumFatura));
    if (iAux <> 0) then
    begin
      sAuxNumFatura[iAux]     := Mes[1];
      sAuxNumFatura[iAux + 1] := Mes[2];
    end;

    iAux := Pos('YYYY',upperCase(sAuxNumFatura));
    if (iAux <> 0) then
    begin
      sAuxNumFatura[iAux]     := Ano[1];
      sAuxNumFatura[iAux + 1] := Ano[2];
      sAuxNumFatura[iAux + 2] := Ano[3];
      sAuxNumFatura[iAux + 3] := Ano[4];
    end;

    iAux := Pos('YY',upperCase(sAuxNumFatura));
    if (iAux <> 0) then
    begin
      sAuxNumFatura[iAux]     := Ano[3];
      sAuxNumFatura[iAux + 1] := Ano[4];
    end;

    iAux    := Pos('#',upperCase(sAuxNumFatura));
    iPosFin := 0;
    if (iAux <> 0) then
    begin
      while (Pos('#',upperCase(sAuxNumFatura)) <> 0) do
      begin
        iPosFin := Pos('#',upperCase(sAuxNumFatura));
        sAuxNumFatura[iPosFin] := '0';
      end;

      sValSeq := IntToStr(LeultRegistro(nil,'CERTFICADORETENCAO'));
      for X:=Length(sValSeq) DownTo 1 do
      begin
        sAuxNumFatura[iPosFin] := sValSeq[x];
        Dec(iPosFin);
      end;
    end;

    sSql := 'UPDATE LANCTODOCUM SET NUMRECIBO = ''' + sAuxNumFatura + ''', FLGFATEMITIDA = ''S''' +
            ' WHERE (CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') and ' +
            '       (NUMLANCTO = ' + IntToStr(iNumLancto) + ')';

    Result := ((Trim(sAuxNumFatura) <> '') and (ExecutarQuery(DtmBaseDados.qry,sSql)));
  end
  else
  begin
    if InputQuery('Atenção','Digite o Nº de controle Documento a ser impresso',sAuxNumFatura) then
    begin
      case (cTipoDoc) of
        'F','C':
           sSql := 'UPDATE LANCTODOCUM SET NUMFATURA = ''' + sAuxNumFatura + ''', FLGFATEMITIDA = ''S''' +
                   ' WHERE (CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') and ' +
                   '       (NUMLANCTO = ' + IntToStr(iNumLancto) + ')';
        'R':
           sSql := 'UPDATE LANCTODOCUM SET NUMRECIBO = ''' + sAuxNumFatura + ''', FLGFATEMITIDA = ''S''' +
                   ' WHERE (CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') and ' +
                   '       (NUMLANCTO = ' + IntToStr(iNumLancto) + ')';
      end;

      Result := ((Trim(sAuxNumFatura) <> '') and (ExecutarQuery(DtmBaseDados.qry,sSql)));
    end
    else
      Result := false;
  end;

  if (Result) then
    CommitTransacao
  else
    RollbackTransacao;
end;

function TModulo.ValidaDataPagtoRecto(iCodDocumento:LongInt; DataPagto:string): boolean;
begin
  Result := not(FazQuery(dtmBaseDados.qry,
    'Select datalancto from lanctodocum where coddocumento='+ IntToStr(iCodDocumento)+
    ' and operacao in (''2'',''3'',''1'',''14'') and '+
    ' datalancto > to_date('+#39+DataPagto+#39+','+'''dd/mm/yyyy'')'));

  if not(Result) then
    MsgDlg('Data do Pagamento Menor que a do Lançamento do documento('+
      dtmBaseDados.qry.FieldByName('datalancto').asString+')','Erro',mterror,[mbOk],0);

  if (dtmBaseDados.qry.Active) then
    dtmBaseDados.qry.Close;
end;

function TModulo.StatusIsAtivo(IdPessoa: integer): boolean;
var
  sNome: string;
begin
  with TwwQuery.Create(Application) do
  try
    DataBaseName := 'BaseDados';
    if (IntegraBack.RecPag = 'P') then
    begin
      SQL.Text := 'SELECT FLGSTATUS FROM EMPRESAFORN WHERE IDFORCLI = ' + FloatToStr(IdPessoa) + ' and IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
      sNome    := 'Fornecedor\Favorecido';
    end
    else
    begin
      SQL.Text := 'SELECT FLGSTATUS FROM EMPRESACLIENTE WHERE IDFORCLI = ' + FloatToStr(IdPessoa) + ' and IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
      sNome    := 'Cliente';
    end;

    Open;

    Result := IsEmpty or (Fields[0].asString <> 'I');

    if not(Result) then
      MsgDlg('Este ' + sNome +' está Inativo. Não é permitido fazer movimentação para o mesmo','Atenção',
        mtInformation,[mbOk],0);

    Close;
  finally
    Free;
  end;
end;

end.
