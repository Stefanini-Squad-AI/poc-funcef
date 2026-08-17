{-------------------------------------------------------------------------------

     IMPORTAÇÃO DE PAGAMENTO DE PARCELAS

     Módulo          :  Alienação
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  19/09/2003
     Data de Término :  22/09/2003

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência    : 27508
Responsável  : Daniel Simões
Data         : 03/03/2008
Descrição    : Ajustes no Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecImportaBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, JCLStrings;

type TImporta = Record
     iRegistro   : Integer;
     sImoCodigo  : String;
     sContrato   : String;
     sImovel     : String;
     iParcelas   : Integer;
     iParcela    : Integer;
     dVencto     : TDateTime;
     dPagto      : TDateTime;
     rVlrPago    : Extended;
     iIdContrato : Integer;
     iIdCondPag  : Integer;
     iIdParcela  : Integer;
end;

type
  TfrmExecImportaBaixa = class(TfrmWizardMT)
    Label8: TLabel;
    edtArqImporta: TEdit;
    btnBuscaArq: TBitBtn;
    btnLimpaArq: TBitBtn;
    Label15: TLabel;
    edtDataImporta: TCMDateTimePicker;
    dlgImporta: TOpenDialog;
    dlgLogErro: TSaveDialog;
    memLog: TMemo;
    cbSubstitui: TCheckBox;
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    dbgImovel: TwwDBGrid;
    cdsParc: TCMClientDataSet;
    dsParc: TDataSource;
    sqlParc: TCMSqlParams;
    cdsParcIDCONTRATOIMOVEL: TFloatField;
    cdsParcIDCONDPAGIMOVEL: TFloatField;
    cdsParcIDPARCFINANCIMOV: TFloatField;
    cdsParcIMOCODIGO: TStringField;
    cdsParcNUMPARCELAS: TFloatField;
    cdsParcNUMPARCELA: TFloatField;
    cdsParcDATAVENCIMENTO: TDateTimeField;
    cdsParcDATAPAGAMENTO: TDateTimeField;
    cdsParcVLRPAGO: TFloatField;
    cdsParcIMONOME: TStringField;
    cdsParcCONNUMERO: TStringField;
    procedure btnLimpaArqClick(Sender: TObject);
    procedure btnBuscaArqClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure dbgImovelCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgImovelTopRowChanged(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    ArqImport : tstringlist;
    bImporta  : Boolean;
    ArqLog    : TextFile;

    function  VerificaPreenchimento: Boolean;
    function  CarregaImportacao: Boolean;
    function  LeValorSepara(const iCampo, iLin: Integer): String;
    function  ConverteValor(const sValor, sCaracDec: string; nDecimal: integer): Extended;
    function  VerificaImporta(var Importa : TImporta) : Boolean;
    function  CarregaImporta(const Importa: TImporta) : Boolean;
    function  GravaLogErro(const iReg,iErro:Integer; const sCodImovel:String = ''; const iParcelas:Integer = -1; const dVencto:TDateTime = -1) : Boolean;
    function  GravaParcelas: Boolean;    
  public
    { Public declarations }
  end;

var
  frmExecImportaBaixa: TfrmExecImportaBaixa;

implementation

uses uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, dBaseDados, uDataBase,
     fProgresso, uFuncoesImob, dFinanciamento;


{$R *.DFM}

procedure TfrmExecImportaBaixa.FormShow(Sender: TObject);
begin
  inherited;
  tabSelecao.PageIndex := 0;
end;

procedure TfrmExecImportaBaixa.btnLimpaArqClick(Sender: TObject);
begin
  inherited;
  edtArqImporta.Clear;
end;

procedure TfrmExecImportaBaixa.btnBuscaArqClick(Sender: TObject);
begin
  inherited;
  dlgImporta.Execute;
  edtArqImporta.Text := dlgImporta.FileName;
end;

function TfrmExecImportaBaixa.VerificaPreenchimento: Boolean;
begin
   Result := False;
   try
      if edtArqImporta.Text = '' then
         raise EValidacao.CreateVal('Informe o arquivo para importação', btnBuscaArq);

      if edtDataImporta.Date <= 0 then
         raise EValidacao.CreateVal('Informe a data do processamento', edtDataImporta);
   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;

procedure TfrmExecImportaBaixa.btnContinuarClick(Sender: TObject);
var bResult : Boolean;
begin
  if PagControle.ActivePageIndex = 0 then begin
     if VerificaPreenchimento then begin
        inherited;
        bResult := CarregaImportacao;
        btnContinuar.Enabled := bResult;
     end;
  end else begin
     if bResult then begin
        inherited;
     end;
  end;
end;


procedure TfrmExecImportaBaixa.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma a Importação do Arquivo','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin;
     GravaParcelas;
  end;
end;


function TfrmExecImportaBaixa.CarregaImportacao: Boolean;
var sReg, sParcela : String;
    bResult : Boolean;
    iLin, fCount,i : Integer;
    Importa : TImporta;
    iTotParc,iQtdParc : Integer;
    fVlrTotal,fTotDet : Extended;
    iVlrTotal,iTotDet : Integer;
begin

//----------------------------------------------------------------------------
//   LAYOUT DO ARQUIVO DE IMPORTAÇÃO:
//
//      TIPO DE REGISTRO A, B, C
//      CODIGO DO IMÓVEL ( IMOCODIGO );
//      PARCELA / TOTAL DE PARCELAS  ( FORMATO: ##/## );
//      DATA VENCIMENTO;
//      DATA PAGAMENTO;
//      VALOR PAGO;
//
//   Obs.: Separados por ponto-virgula, valores sem separador de milhar
//   ---------------------------------------------------------------------------

   Result  := True;
   bResult := True;
   if not FileExists(edtArqImporta.Text) then begin
      MsgDlg('Arquivo para Importação Não Encontrado','Aviso',mtwarning,[mbok],0);
      Result := False;
      Exit;
   end;

   // Abre a query vazia para adicionar os registros importados
   cdsParc.Close;
   sqlParc.Open;
   cdsParc.IndexFieldNames := 'IDPARCFINANCIMOV';

   // Abre o arquivo Texto para importação e um Arquivo texto para gravar os Erros
   ArqImport := nil;
   ArqImport := tStringList.Create;
   ArqImport.LoadFromFile(edtArqImporta.Text);
   memLog.Lines.Clear;

   // ProgressBar
   fCount := ArqImport.Count;
   frmprogresso.MostraFormProgresso('Importando Arquivo de Lançamentos...');

   memLog.Lines.Add('Início da Importação');
   memLog.Lines.Add(' ');

   for iLin := 1 to ArqImport.Count do begin

      frmprogresso.AndaFormProgresso(iLin, fCount);

      // O primeiro registro do arquivo deve ser do tipo A
      sReg := LeValorSepara(1,iLin);
      if (iLin = 1) and (sReg <> 'A') then bResult := GravaLogErro(iLin,1);

      case sReg[1] of
         'A' : // Inicio de Arquivo
               begin
                  iQtdParc := 0;
                  fTotDet  := 0;
               end;

         'B' : // Detalhe de Arquivo
               begin
                  // Limpa variaveis
                  with Importa do begin
                     iRegistro   := -1;
                     sImoCodigo  := '';
                     sContrato   := '';
                     sImovel     := '';
                     iParcelas   := -1;
                     iParcela    := -1;
                     dVencto     := -1;
                     dPagto      := -1;
                     rVlrPago    := 0;
                     iIdContrato := -1;
                     iIdCondPag  := -1;
                     iIdParcela  := -1;
                  end;

                  // Carrega variáveis com os valores do arquivo texto
                  Importa.iRegistro   := iLin;
                  Importa.sImoCodigo  := LeValorSepara(2,iLin);
                  Importa.rVlrPago    := ConverteValor(LeValorSepara(6,iLin),',',2);

                  // Carrega o Nr. de Parcelas
                  sParcela := LeValorSepara(3,iLin);
                  Importa.iParcela  := StrToInt(StrBefore('/',sParcela));
                  Importa.iParcelas := StrToInt(StrAfter ('/',sParcela));

                  // Campos Data
                  try
                    Importa.dVencto   := StrToDate(LeValorSepara(4,iLin));
                    Importa.dPagto    := StrToDate(LeValorSepara(5,iLin));
                  except
                    GravaLogErro(iLin, 15, Importa.sImoCodigo, Importa.iParcelas)
                  end;

                  Inc(iQtdParc);
                  fTotDet := fTotDet + Importa.rVlrPago;

                  // Checa os valores importados e efetua a Carga na tabela virtual
                  if VerificaImporta(Importa) then
                       bResult := CarregaImporta(Importa)
                  else bResult := False;
               end;

         'C' : // Fim de Arquivo
               begin
                  iTotParc  := StrToInt(LeValorSepara(2,iLin));
                  fVlrTotal := ConverteValor(LeValorSepara(3,iLin),',',2);

                  // Valida total de registros
                  if iTotParc <> iQtdParc then bResult := GravaLogErro(iLin,3);

                  // valida total de valores
                  fVlrTotal := Int(fVlrTotal * 100);
                  fTotDet   := Int(fTotDet * 100);

                  if fVlrTotal <> fTotDet then
                     bResult := GravaLogErro(iLin,4, 'Valor Informado: ' + FloatToStr(fVlrtotal) + '  Valor Arquivo: ' + FloatToStr(fTotDet) );
               end;
      end;
      if bResult = False then Result := False;
   end;

   // O Ultimo Registro deve ser do tipo C
   if sReg <> 'C' then Result := GravaLogErro(iLin,2);

   cdsParc.First;
   cdsParc.IndexFieldNames := 'IMOCODIGO;DATAVENCIMENTO';

   frmProgresso.EscondeFormProgresso;
   memLog.Lines.Add(' ');
   memLog.Lines.Add('Término da Importação');
end;



function TfrmExecImportaBaixa.GravaLogErro(const iReg, iErro: Integer;
        const sCodImovel: String; const iParcelas: Integer; const dVencto: TDateTime): Boolean;
var sMensErro,sIniErro : String;
begin
   if iErro > 0 then
        Result := False
   else Result := True;

   // Define Mensagens de Erro
   case iErro of
      1 : sMensErro := 'Não existe registro de Inicialização - Tipo A ';
      2 : sMensErro := 'Não existe registro de Finalização - Tipo C ';
      3 : sMensErro := 'Total de Lançamentos Inválido ';
      4 : sMensErro := 'Valor total das parcelas importadas inválido ';
      5 : sMensErro := 'Erro ao buscar o Contrato ';
      6 : sMensErro := 'Não existe contrato ativo para o imóvel informado ';
      7 : sMensErro := 'Existem mais de um contrato ativo para o imóvel informado ';
      8 : sMensErro := 'Existem mais de um imóvel no contrato do imóvel informado ';
      9 : sMensErro := 'Erro ao buscar a Condição de Pagamento ';
     10 : sMensErro := 'Não existe condição de pagamento para o nr. de parcelas ';
     11 : sMensErro := 'Existem mais de uma condição de pagamento com o mesmo nr. de parcelas ';
     12 : sMensErro := 'Erro ao buscar a Parcela ';
     13 : sMensErro := 'Não existe parcela o vencimento ';
     14 : sMensErro := 'Existem mais de uma parcela com o mesmo vencimento ';
     15 : sMensErro := 'Parcela integrada não pode ser importada ';
     16 : sMensErro := 'Parcela já importada ';
     17 : sMensErro := 'Parcela vencida em 2003 deverá ser integrada ';
     20 : sMensErro := 'Parcela já registrada ';
   end;

   sIniErro := '';
   if iReg       > 0   then sIniErro := IntToStr(iReg) + ' - ';
   if sCodImovel <> '' then sIniErro := sIniErro + 'Imo. ' + sCodImovel + ' - ';
   if iParcelas  > 0   then sIniErro := sIniErro + 'Cp. ' + IntToStr(iParcelas) + ' - ';
   if dVencto    > 0   then sIniErro := sIniErro + 'Venc. ' + DateToStr(dVencto) + ' - ';

   sMensErro := sIniErro + sMensErro;
   memLog.Lines.Add(sMensErro);
end;


function TfrmExecImportaBaixa.VerificaImporta(var Importa: TImporta): Boolean;
var sSql : String;
begin
   Result := False;

   // Busca contrato
   sSql := 'SELECT C.IDCONTRATOIMOVEL, C.CONNUMERO, TI.TOT_IMOVEL, '+#13+
           '       (IM.IMONOME || '' -  '' || I.IMONOME) AS IMOVEL_EXTENSO '+#13+
           '  FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IMOVEL I, IMOVEL IM, '+#13+
           '       ( SELECT C1.IDCONTRATOIMOVEL, COUNT(C2.IDIMOVEL) AS TOT_IMOVEL '+#13+
           '           FROM CONTRATOIMOVEL C1, CONTRATOXIMOVEL C2 '+#13+
           '          WHERE C1.IDCONTRATOIMOVEL = C2.IDCONTRATOIMOVEL '+#13+
           '            AND C1.FLGTIPOCONTRATO = ''C''  '+#13+
           '          GROUP BY C1.IDCONTRATOIMOVEL ) TI '+#13+
           ' WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '+#13+
           '   AND C.IDCONTRATOIMOVEL = TI.IDCONTRATOIMOVEL  '+#13+
           '   AND CXI.IDIMOVEL = I.IDIMOVEL '+#13+
           '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL '+#13+
           '   AND C.FLGTIPOCONTRATO = ''C'' '+#13+
           '   AND I.IMOCODIGO = ' + QuotedStr(Importa.sImoCodigo);
   FazQuery(dtmFinanciamento.qryAux, sSql);

   // Erro 6 - Não existe contrato ativo para o ImoCodigo
   if dtmFinanciamento.qryAux.IsEmpty then begin
      Result := GravaLogErro(Importa.iRegistro, 6, Importa.sImoCodigo);
      Exit;
   end;
   // Erro 7 - Existe mais de um contrato para o ImoCodigo
   if dtmFinanciamento.qryAux.RecordCount > 1 then begin
      Result := GravaLogErro(Importa.iRegistro, 7, Importa.sImoCodigo);
      Exit;
   end;
   // Erro 8 - Existe mais de um imóvel para o contrato
   if dtmFinanciamento.qryAux.FieldByName('TOT_IMOVEL').AsInteger > 1 then begin
      Result := GravaLogErro(Importa.iRegistro, 8, Importa.sImoCodigo);
      Exit;
   end;
   Importa.iIdContrato := dtmFinanciamento.qryAux.FieldByName('IDCONTRATOIMOVEL').AsInteger;
   Importa.sContrato   := dtmFinanciamento.qryAux.FieldByName('CONNUMERO').AsString;
   Importa.sImovel     := dtmFinanciamento.qryAux.FieldByName('IMOVEL_EXTENSO').AsString;

   // Busca a condição de pagamento
   sSql := 'SELECT IDCONDINICIAL '+#13+
           '  FROM CONDPAGIMOVEL '+#13+
           ' WHERE IDREPACTUA IS NULL '+#13+
           '   AND IDCONTRATOIMOVEL = '+ IntToStr(Importa.iIdContrato) +#13+
           '   AND NUMPARCELAS = ' + IntToStr(Importa.iParcelas);
   FazQuery(dtmFinanciamento.qryAux, sSql);

   // Erro 10 - Não existe condição de pagamento para o nr. de parcelas
   if dtmFinanciamento.qryAux.IsEmpty then begin
      Result := GravaLogErro(Importa.iRegistro, 10, Importa.sImoCodigo, Importa.iParcelas);
      Exit;
   end;
   // Erro 11 - Existe mais de uma condição de pagamento com o mesmo nr. de parcelas
   if dtmFinanciamento.qryAux.RecordCount > 1 then begin
      Result := GravaLogErro(Importa.iRegistro, 11, Importa.sImoCodigo, Importa.iParcelas);
      Exit;
   end;
   Importa.iIdCondPag := dtmFinanciamento.qryAux.FieldByName('IDCONDINICIAL').AsInteger;

   // Busca a parcela
   sSql := 'SELECT IDPARCFINANCIMOV, NUMPARCELA, PLNCODIGO, CODDOCUMENTO, DATAPAGAMENTO '+#13+
           '  FROM PARCFINANCIMOV  '+#13+
           ' WHERE FLGTIPOLANC > 1 '+#13+
           '   AND IDCONDPAGIMOVEL = ' + IntToStr(Importa.iIdCondPag) +#13+
           '   AND DATAVENCIMENTO = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',Importa.dVencto)) +' ,''DD/MM/YYYY'')';
   FazQuery(dtmFinanciamento.qryAux, sSql);

   // Erro 13 - Não existe parcela para a data de vencimento
   if dtmFinanciamento.qryAux.IsEmpty then begin
      Result := GravaLogErro(Importa.iRegistro, 13, Importa.sImoCodigo, Importa.iParcelas, Importa.dVencto);
      Exit;
   end;
   // Erro 14 - Existe mais de uma parcela com a mesma data de vencimento
   if dtmFinanciamento.qryAux.RecordCount > 1 then begin
      Result := GravaLogErro(Importa.iRegistro, 14, Importa.sImoCodigo, Importa.iParcelas, Importa.dVencto);
      Exit;
   end;
   // Erro 15 - Parcela integrada
   if (not dtmFinanciamento.qryAux.FieldByName('PLNCODIGO').IsNull) or
      (not dtmFinanciamento.qryAux.FieldByName('CODDOCUMENTO').IsNull) then begin
      Result := GravaLogErro(Importa.iRegistro, 15, Importa.sImoCodigo, Importa.iParcelas, Importa.dVencto);
      Exit;
   end;
   // Erro 16 - Parcela já importada
   if (not dtmFinanciamento.qryAux.FieldByName('DATAPAGAMENTO').IsNull) and
      (not cbSubstitui.Checked) then begin
      Result := GravaLogErro(Importa.iRegistro, 16, Importa.sImoCodigo, Importa.iParcelas, Importa.dVencto);
      Exit;
   end;
   // Erro 17 - Parcela vencida em 2003 deve ser integrada
   if Importa.dVencto >= StrToDate('01/01/2003')  then begin
      Result := GravaLogErro(Importa.iRegistro, 17, Importa.sImoCodigo, Importa.iParcelas, Importa.dVencto);
      Exit;
   end;

   Importa.iIdParcela := dtmFinanciamento.qryAux.FieldByName('IDPARCFINANCIMOV').AsInteger;
   Importa.iParcela   := dtmFinanciamento.qryAux.FieldByName('NUMPARCELA').AsInteger;

   Result := True;
end;


function TfrmExecImportaBaixa.CarregaImporta(const Importa: TImporta): Boolean;
begin
   Result := True;
   try
      // Inclui a tabela de parcelas
      // Erro 17: Cadastro da parcela Duplicada
      if not cdsParc.FindKey([Importa.iIdParcela]) then begin
         cdsParc.Insert;
         cdsParcIMOCODIGO.AsString         := Importa.sImoCodigo;
         cdsParcCONNUMERO.AsString         := Importa.sContrato;
         cdsParcIMONOME.AsString           := Importa.sImovel;
         cdsParcIDPARCFINANCIMOV.AsInteger := Importa.iIdParcela;
         cdsParcIDCONDPAGIMOVEL.AsInteger  := Importa.iIdCondPag;
         cdsParcIDCONTRATOIMOVEL.AsInteger := Importa.iIdContrato;
         cdsParcNUMPARCELAS.AsInteger      := Importa.iParcelas;
         cdsParcNUMPARCELA.AsInteger       := Importa.iParcela;
         cdsParcDATAVENCIMENTO.AsDateTime  := Importa.dVencto;
         cdsParcDATAPAGAMENTO.AsDateTime   := Importa.dPagto;
         cdsParcVLRPAGO.AsFloat            := Importa.rVlrPago;
         cdsParc.Post;
      end else begin
         Result := GravaLogErro(Importa.iRegistro, 20, Importa.sImoCodigo, Importa.iParcelas, Importa.dVencto);
         Exit;
      end;
   except
      Result := False;
   end;
end;


function TfrmExecImportaBaixa.GravaParcelas: Boolean;
var sSql : String;
    fCount, iRec : Integer;
begin
   try
      try
         StartTransacao;

         iRec   := 1;
         fCount := cdsParc.RecordCount;
         frmprogresso.MostraFormProgresso('Importando Arquivo de Lançamentos...');

         Result := True;
         cdsParc.DisableControls;
         cdsParc.First;
         while not cdsParc.Eof do begin
            frmprogresso.AndaFormProgresso(iRec, fCount);

            sSql := 'UPDATE PARCFINANCIMOV '+#13+
                    '   SET FLGLANCINTEGRA   = 4, '+#13+
                    '       DATALANCINTEGRA  = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataImporta.Date)) +' ,''DD/MM/YYYY''), '+#13+
                    '       DATAPAGAMENTO    = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', cdsParcDATAPAGAMENTO.AsDateTime)) +' ,''DD/MM/YYYY''), '+#13+
                    '       VLRPAGO          = ' + ComunsImobiliario.StrTran(cdsParcVLRPAGO.AsString,',','.') +#13+
                    ' WHERE IDPARCFINANCIMOV = ' + cdsParcIDPARCFINANCIMOV.AsString;
            if not ExecutaQuery(dtmFinanciamento.qryAux, sSql) then raise exception.create('');
            cdsParc.Next;
            Inc(iRec);
         end;
         CommitTransacao;
         MsgDlg('Importação realizada com sucesso','Informação',mtWarning,[mbOk],0);
      except
         Result := False;
         RollBackTransacao;
         MsgDlg('Ocorreram erros na atualização das parcelas','Erro',mtError,[mbOk],0);
      end;
   finally
      cdsParc.First;
      cdsParc.EnableControls;
      frmProgresso.EscondeFormProgresso;
   end;
end;


function TfrmExecImportaBaixa.LeValorSepara(const iCampo, iLin: Integer): String;
var iIni,iFim : Integer;
    temp : string;
    bUltimoCampo : Boolean;
begin
   temp := '';
   if ArqImport <> nil then begin
     temp := ArqImport[iLin-1];
     if iCampo = 1 then begin                     // primeiro campo
       iIni := 0;
       iFim := StrNPos(temp,';',1) - 1;
       if iFim < 0 then iFim := Length(temp);
     end else begin
       iIni := StrNPos(temp,';',iCampo -1) + 1;
       if StrNPos(temp,';',iCampo) = 0 then       // ultimo Campo
            iFim := (Length(temp)+1) - iIni
       else iFim := StrNPos(temp,';',iCampo) - iIni;
     end;
     temp := copy(temp,iIni,iFim);
   end;
   temp   := Trim(temp);
   Result := temp;
end;


function TfrmExecImportaBaixa.ConverteValor(const sValor, sCaracDec: string; nDecimal: integer): Extended;
var sDecAnt  : char;
    fVlrConv : Extended;
    i        : Integer;
begin
  if sValor = '' then begin
     fVlrConv := 0;
  end else begin
     if sCaracDec = '' then begin
        try
           fVlrConv := StrToFloat(sValor);
           if nDecimal <= 0 then nDecimal := 2;
           for i := 1 to nDecimal do fVlrConv := fVlrConv / 10;
        except
           fVlrConv := 0;
        end;
     end else begin
       sDecAnt := decimalseparator;
       fVlrConv := 0;
       try
          decimalseparator := sCaracDec[1];
          fVlrConv := StrToFloat(sValor);
       finally
         decimalseparator := sDecAnt;
       end;
     end;
  end;
  Result := fVlrConv;
end;



procedure TfrmExecImportaBaixa.dbgImovelCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWindow;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmExecImportaBaixa.dbgImovelTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;


end.
