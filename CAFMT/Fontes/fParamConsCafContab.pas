unit fParamConsCafContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, CMProcuraMask, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables,
  Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamConsCafContab = class(TfrmOkCancelar)
    grpPeriodo: TGroupBox;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    chkDif: TCheckBox;
    chkIntegra: TCheckBox;
    qryMovCaf: TwwQuery;
    qryMovCafDATA: TDateTimeField;
    qryMovCafGRUPO: TFloatField;
    qryMovCafTIPOMOV: TFloatField;
    qryMovCafVALOR: TFloatField;
    qryMovCafCONTADB: TStringField;
    qryMovCafCONTACR: TStringField;
    qryMovCafCODCENTROCUSTO: TStringField;
    qryCafxContab: TwwQuery;
    updCafxContab: TUpdateSQL;
    qryCafxContabDATA: TDateTimeField;
    qryCafxContabCONTACONTABIL: TStringField;
    qryCafxContabCENTROCUSTO: TStringField;
    qryCafxContabVLCONTABDEB: TFloatField;
    qryCafxContabVLCONTABCRE: TFloatField;
    qryCafxContabVLCAFDEB: TFloatField;
    qryCafxContabVLCAFCRE: TFloatField;
    GroupBox2: TGroupBox;
    qryGrupoIni: TwwQuery;
    qryGrupoIniCLASSE: TStringField;
    qryGrupoIniNOME: TStringField;
    qryGrupoIniIDGRUPO: TFloatField;
    cmbGrupoIni: TwwDBLookupCombo;
    qryMovTrf: TwwQuery;
    qryMovTrfDATAMOVIMENTACAO: TDateTimeField;
    qryMovTrfIDGRUPO: TFloatField;
    qryMovTrfIDGRUPANT: TFloatField;
    qryMovTrfIDTIPOMOVIMENTACAO: TFloatField;
    qryMovTrfTRFVALORG: TFloatField;
    qryMovTrfTRFCMBEM: TFloatField;
    qryMovTrfTRFDEPLANC: TFloatField;
    qryMovTrfTRFCMDEP: TFloatField;
    qryMovTrfTRFREAVVALORG: TFloatField;
    qryMovTrfTRFREAVCMBEM: TFloatField;
    qryMovTrfTRFREAVDEPLANC: TFloatField;
    qryMovTrfTRFREAVCMDEP: TFloatField;
    qryMovTrfTRFAVVALORG: TFloatField;
    qryMovTrfTRFAVCMBEM: TFloatField;
    qryMovTrfTRFAVDEPLANC: TFloatField;
    qryMovTrfTRFAVCMDEP: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbGrupoIniExit(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iGrupoIni : Integer;
    tblTrfCaf : tTable;
    procedure GeraTabTemp;
  end;

var
  frmParamConsCafContab: TfrmParamConsCafContab;

implementation

{$R *.DFM}

uses dRelOperCaf, uSistema, uMensErro, uLancContab, uIntegraBack, fAguarde,
     dAtivoFixo, uAtivoFixo;

procedure TfrmParamConsCafContab.FormCreate(Sender: TObject);
begin
   inherited;
   if not qryCafxContab.Prepared then qryCafxContab.Prepare;
   if not qryMovCaf.Prepared     then qryMovCaf.Prepare;
   if not qryGrupoIni.Prepared   then qryGrupoIni.Prepare;
   //-------------------------------------------------------------------------------------
   qryGrupoIni.Open;
   iGrupoIni := 0;
end;
//========================================================================================
procedure TfrmParamConsCafContab.FormActivate(Sender: TObject);
begin
   inherited;
   edDataFim.Date := Date;
   edDataIni.SetFocus;
end;
//========================================================================================
procedure TfrmParamConsCafContab.bbtnConfirmarClick(Sender: TObject);
var
   qryCafCtb                         : TwwQuery;
   iPlanoConta,
   iGrupoNovo,iGrupoAtual            : Integer;
   sDebito,    sCredito,
   sDebitoCM,  sCreditoCM,
   sDebitoD,   sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sReavDebito,    sReavCredito,
   sReavDebitoCM,  sReavCreditoCM,
   sReavDebitoD,   sReavCreditoD,
   sReavDebitoCMD, sReavCreditoCMD,
   sAVDebito,    sAVCredito,
   sAVDebitoCM,  sAVCreditoCM,
   sAVDebitoD,   sAVCreditoD,
   sAVDebitoCMD, sAVCreditoCMD       : String;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
   Screen.Cursor := crSQLWait;
   qryCafCtb := TwwQuery(dtmRelOperCaf.qryConsCafContab);
   //-------------------------------------------------------------------------------------
   frmAguarde.Min := 0;
   frmAguarde.Max := 1;
   frmAguarde.Pos := 0;
   frmAguarde.Mostra('Preparando as Planilhas ...');
   //-------------------------------------------------------------------------------------
   qryCafxContab.Close;
   if (chkIntegra.Checked) then
   begin
      qryCafxContab.SQL.Strings[11] := 'AND (PLN.PLNEFETIVADO = ''S'')';
   end else
   begin
      qryCafxContab.SQL.Strings[11] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   qryCafxContab.ParamByName('PDATAINI').AsDateTime := edDataIni.Date;
   qryCafxContab.ParamByName('PDATAFIM').AsDateTime := edDataFim.Date;
   qryCafxContab.Open;
   frmAguarde.Pos := 1;
   if qryCafxContab.IsEmpty then
   begin
      MsgDlg('Não houve Lançamentos Contábeis com os Parâmetros Fornecidos!',
             'Erro', mtError, [mbOk], 0);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   frmAguarde.Pos := 0;
   frmAguarde.Mostra('Preparando as Movimentações ...');
   //-------------------------------------------------------------------------------------
   qryMovCaf.Close;
   if (iGrupoIni <> 0) then
   begin
      qryMovCaf.SQL.Strings[32] := 'AND (LANC.IDGRUPO = '+IntToStr(iGrupoIni)+')';
   end else
   begin
      qryMovCaf.SQL.Strings[32] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   qryMovCaf.ParamByName('PDATAINI').AsDateTime := edDataIni.Date;
   qryMovCaf.ParamByName('PDATAFIM').AsDateTime := edDataFim.Date;
   qryMovCaf.Open;
   frmAguarde.Pos := 1;
   if qryMovCAF.IsEmpty then
   begin
      MsgDlg('Não houve Movimentação de Ativo Fixo com os Parâmetros Fornecidos!',
             'Erro', mtError, [mbOk], 0);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   frmAguarde.Max := qryMovCaf.RecordCount;
   frmAguarde.Pos := 0;
   frmAguarde.Mostra('Processando a Conciliação (1)...');
   //-------------------------------------------------------------------------------------
   while not qryMovCaf.EOF do
   begin
      frmAguarde.Pos := frmAguarde.Pos + 1;
      //----------------------------------------------------------------------------------
      // Pesquisa em CafxContab : Data, Conta Contábil e Centro de Custo á Debito
      // se não encontrar pesquisa Data e Conta Contábil á Debito.
      //----------------------------------------------------------------------------------
      if (qryCafxContab.Locate('DATA;CONTACONTABIL;CENTROCUSTO',
                               VarArrayOf([qryMovCafDATA.AsDateTime,
                                           qryMovCafCONTADB.AsString,
                                           qryMovCafCODCENTROCUSTO.AsString]),[])) then
      begin
         qryCafxContab.Edit;
         qryCafxContabVLCAFDEB.AsFloat := qryCafxContabVLCAFDEB.AsFloat + qryMovCafVALOR.AsFloat;
         qryCafxContab.Post;
      end else
      begin
         if (qryCafxContab.Locate('DATA;CONTACONTABIL',
                                  VarArrayOf([qryMovCafDATA.AsDateTime,
                                              qryMovCafCONTADB.AsString]),[])) then
         begin
            qryCafxContab.Edit;
            qryCafxContabVLCAFDEB.AsFloat := qryCafxContabVLCAFDEB.AsFloat + qryMovCafVALOR.AsFloat;
            qryCafxContab.Post;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Pesquisa em CafxContab : Data, Conta Contábil e Centro de Custo á Crédito
      // se não encontrar pesquisa Data e Conta Contábil á Crédito.
      //----------------------------------------------------------------------------------
      if (qryCafxContab.Locate('DATA;CONTACONTABIL;CENTROCUSTO',
                               VarArrayOf([qryMovCafDATA.AsDateTime,

                                           qryMovCafCONTACR.AsString,
                                           qryMovCafCODCENTROCUSTO.AsString]),[])) then
      begin
         qryCafxContab.Edit;
         qryCafxContabVLCAFCRE.AsFloat := qryCafxContabVLCAFCRE.AsFloat + qryMovCafVALOR.AsFloat;
         qryCafxContab.Post;
      end else
      begin
         if (qryCafxContab.Locate('DATA;CONTACONTABIL',
                                  VarArrayOf([qryMovCafDATA.AsDateTime,
                                              qryMovCafCONTACR.AsString]),[])) then
         begin
            qryCafxContab.Edit;
            qryCafxContabVLCAFCRE.AsFloat := qryCafxContabVLCAFCRE.AsFloat + qryMovCafVALOR.AsFloat;
            qryCafxContab.Post;
         end;
      end;
      //----------------------------------------------------------------------------------
      qryMovCaf.Next;
   end;
   //-------------------------------------------------------------------------------------
   // Processa as Contabilizacoes das Transferências
   //-------------------------------------------------------------------------------------
   try
      GeraTabTemp;
      tblTrfCaf.Open;
      //----------------------------------------------------------------------------------
      qryMovTrf.Close;
      if (iGrupoIni <> 0) then
      begin
         qryMovTrf.SQL.Strings[08] := 'AND (B.IDGRUPO = '+IntToStr(iGrupoIni)+')';
      end else
      begin
         qryMovTrf.SQL.Strings[08] := ' ';
      end;
      //----------------------------------------------------------------------------------
      qryMovTrf.ParamByName('PDATAINI').AsDateTime := edDataIni.Date;
      qryMovTrf.ParamByName('PDATAFIM').AsDateTime := edDataFim.Date;
      qryMovTrf.Open;
      //----------------------------------------------------------------------------------
      frmAguarde.Pos := 0;
      frmAguarde.Max := qryMovTrf.RecordCount;
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Processando a Conciliação (2) ...');
      //----------------------------------------------------------------------------------
      while not qryMovTrf.EOF do
      begin
         frmAguarde.Pos := frmAguarde.Pos + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         iGrupoNovo  := qryMovTrfIDGRUPO.AsInteger;
         iGrupoAtual := qryMovTrfIDGRUPANT.AsInteger;
         //-------------------------------------------------------------------------------
         with AtivoFixo do
         begin
            Localiza_ContaContabil(iGrupoNovo ,01,'D',iPlanoConta,sDebito);
            Localiza_ContaContabil(iGrupoAtual,01,'D',iPlanoConta,sCredito);
            tblTrfCaf.Append;
            tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
            tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
            tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 01;
            tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFVALORG.AsFloat;
            tblTrfCaf.FieldByName('CONTADB').AsString  := sDebito;
            tblTrfCaf.FieldByName('CONTACR').AsString  := sCredito;
            tblTrfCaf.Post;
            //----------------------------------------------------------------------------
            Localiza_ContaContabil(iGrupoNovo ,15,'D',iPlanoConta,sDebitoCM);
            Localiza_ContaContabil(iGrupoAtual,15,'D',iPlanoConta,sCreditoCM);
            tblTrfCaf.Append;
            tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
            tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
            tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 15;
            tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFCMBEM.AsFloat;
            tblTrfCaf.FieldByName('CONTADB').AsString  := sDebitoCM;
            tblTrfCaf.FieldByName('CONTACR').AsString  := sCreditoCM;
            tblTrfCaf.Post;
            //----------------------------------------------------------------------------
            Localiza_ContaContabil(iGrupoAtual,14,'C',iPlanoConta,sDebitoD);
            Localiza_ContaContabil(iGrupoNovo ,14,'C',iPlanoConta,sCreditoD);
            tblTrfCaf.Append;
            tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
            tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
            tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 14;
            tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFDEPLANC.AsFloat;
            tblTrfCaf.FieldByName('CONTADB').AsString  := sDebitoD;
            tblTrfCaf.FieldByName('CONTACR').AsString  := sCreditoD;
            tblTrfCaf.Post;
            //----------------------------------------------------------------------------
            Localiza_ContaContabil(iGrupoNovo ,21,'C',iPlanoConta,sDebitoCMD);
            Localiza_ContaContabil(iGrupoAtual,21,'C',iPlanoConta,sCreditoCMD);
            tblTrfCaf.Append;
            tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
            tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
            tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 21;
            tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFCMDEP.AsFloat;
            tblTrfCaf.FieldByName('CONTADB').AsString  := sDebitoCMD;
            tblTrfCaf.FieldByName('CONTACR').AsString  := sCreditoCMD;
            tblTrfCaf.Post;
            //----------------------------------------------------------------------------
            if qryMovTrfTRFREAVVALORG.AsFloat >= 0 then
            begin
               Localiza_ContaContabil(iGrupoNovo ,08,'D',iPlanoConta,sReavDebito);
               Localiza_ContaContabil(iGrupoAtual,08,'D',iPlanoConta,sReavCredito);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 08;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFREAVVALORG.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sReavDebito;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sReavCredito;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoNovo ,22,'D',iPlanoConta,sReavDebitoCM);
               Localiza_ContaContabil(iGrupoAtual,22,'D',iPlanoConta,sReavCreditoCM);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 22;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFREAVCMBEM.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoCM;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoCM;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoAtual,18,'C',iPlanoConta,sReavDebitoD);
               Localiza_ContaContabil(iGrupoNovo ,18,'C',iPlanoConta,sReavCreditoD);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 18;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFREAVDEPLANC.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoD;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoD;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoNovo ,19,'C',iPlanoConta,sReavDebitoCMD);
               Localiza_ContaContabil(iGrupoAtual,19,'C',iPlanoConta,sReavCreditoCMD);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 19;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFREAVCMDEP.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoCMD;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoCMD;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
            end else
            begin
               Localiza_ContaContabil(iGrupoNovo ,23,'C',iPlanoConta,sReavDebito);
               Localiza_ContaContabil(iGrupoAtual,23,'C',iPlanoConta,sReavCredito);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 23;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFREAVVALORG.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sReavDebito;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sReavCredito;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoNovo ,22,'C',iPlanoConta,sReavDebitoCM);
               Localiza_ContaContabil(iGrupoAtual,22,'C',iPlanoConta,sReavCreditoCM);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 22;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFREAVCMBEM.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoCM;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoCM;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoAtual,18,'D',iPlanoConta,sReavDebitoD);
               Localiza_ContaContabil(iGrupoNovo ,18,'D',iPlanoConta,sReavCreditoD);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 18;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFREAVDEPLANC.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoD;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoD;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoNovo ,19,'D',iPlanoConta,sReavDebitoCMD);
               Localiza_ContaContabil(iGrupoAtual,19,'D',iPlanoConta,sReavCreditoCMD);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 19;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFREAVCMDEP.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoCMD;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoCMD;
               tblTrfCaf.Post;
            end;
            //----------------------------------------------------------------------------
            if qryMovTrfTRFAVVALORG.AsFloat >= 0 then
            begin
               Localiza_ContaContabil(iGrupoNovo ,09,'D',iPlanoConta,sAVDebito);
               Localiza_ContaContabil(iGrupoAtual,09,'D',iPlanoConta,sAVCredito);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 09;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFAVVALORG.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sAVDebito;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sAVCredito;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoNovo ,34,'D',iPlanoConta,sAVDebitoCM);
               Localiza_ContaContabil(iGrupoAtual,34,'D',iPlanoConta,sAVCreditoCM);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 34;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFAVCMBEM.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoCM;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoCM;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoAtual,35,'C',iPlanoConta,sAVDebitoD);
               Localiza_ContaContabil(iGrupoNovo ,35,'C',iPlanoConta,sAVCreditoD);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 35;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFAVDEPLANC.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoD;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoD;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoNovo ,36,'C',iPlanoConta,sAVDebitoCMD);
               Localiza_ContaContabil(iGrupoAtual,36,'C',iPlanoConta,sAVCreditoCMD);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 36;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFAVDEPLANC.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoCMD;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoCMD;
               tblTrfCaf.Post;
            end else
            begin
               Localiza_ContaContabil(iGrupoNovo ,09,'C',iPlanoConta,sAVDebito);
               Localiza_ContaContabil(iGrupoAtual,09,'C',iPlanoConta,sAVCredito);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 09;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFAVVALORG.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sAVDebito;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sAVCredito;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoNovo ,34,'C',iPlanoConta,sAVDebitoCM);
               Localiza_ContaContabil(iGrupoAtual,34,'C',iPlanoConta,sAVCreditoCM);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 34;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFAVCMBEM.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoCM;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoCM;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoAtual,35,'D',iPlanoConta,sAVDebitoD);
               Localiza_ContaContabil(iGrupoNovo ,35,'D',iPlanoConta,sAVCreditoD);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 35;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFAVDEPLANC.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoD;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoD;
               tblTrfCaf.Post;
               //-------------------------------------------------------------------------
               Localiza_ContaContabil(iGrupoNovo ,36,'D',iPlanoConta,sAVDebitoCMD);
               Localiza_ContaContabil(iGrupoAtual,36,'D',iPlanoConta,sAVCreditoCMD);
               tblTrfCaf.Append;
               tblTrfCaf.FieldByName('DATA').AsDateTime   := qryMovTrfDATAMOVIMENTACAO.AsDateTime;
               tblTrfCaf.FieldByName('GRUPO').AsInteger   := qryMovTrfIDGRUPO.AsInteger;
               tblTrfCaf.FieldByName('TIPOMOV').AsInteger := 36;
               tblTrfCaf.FieldByName('VALOR').AsFloat     := qryMovTrfTRFAVCMDEP.AsFloat;
               tblTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoCMD;
               tblTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoCMD;
               tblTrfCaf.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         qryMovTrf.Next;
      end;
      //----------------------------------------------------------------------------------
      frmAguarde.Pos := 0;
      frmAguarde.Max := qryMovTrf.RecordCount;
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Processando a Conciliação (3) ...');
      //----------------------------------------------------------------------------------
      tblTrfCaf.First;
      while not tblTrfCaf.EOF do
      begin
         frmAguarde.Pos := frmAguarde.Pos + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Pesquisa em CafxContab : Data, Conta Contábil á Débito
         //-------------------------------------------------------------------------------
         if (qryCafxContab.Locate('DATA;CONTACONTABIL',
                                  VarArrayOf([tblTrfCaf.FieldByName('DATA').AsDateTime,
                                              tblTrfCaf.FieldByName('CONTADB').AsString]),[])) then
         begin
            qryCafxContab.Edit;
            qryCafxContabVLCAFDEB.AsFloat := qryCafxContabVLCAFDEB.AsFloat + tblTrfCaf.FieldByName('VALOR').AsFloat;
            qryCafxContab.Post;
         end;
         //-------------------------------------------------------------------------------
         // Pesquisa em CafxContab : Data, Conta Contábil á Crédito
         //-------------------------------------------------------------------------------
         if (qryCafxContab.Locate('DATA;CONTACONTABIL',
                                  VarArrayOf([tblTrfCaf.FieldByName('DATA').AsDateTime,
                                              tblTrfCaf.FieldByName('CONTACR').AsString]),[])) then
         begin
            qryCafxContab.Edit;
            qryCafxContabVLCAFCRE.AsFloat := qryCafxContabVLCAFCRE.AsFloat + tblTrfCaf.FieldByName('VALOR').AsFloat;
            qryCafxContab.Post;
         end;
         //-------------------------------------------------------------------------------
         tblTrfCaf.Next;
      end;
      tblTrfCaf.Close;
      tblTrfCaf.Free;
   except
      tblTrfCaf.Close;
      tblTrfCaf.Free;
      raise;
   end;
   //-------------------------------------------------------------------------------------
   // Alimenta a Query do Relatório
   //-------------------------------------------------------------------------------------
   frmAguarde.Max := qryCafxContab.RecordCount;
   frmAguarde.Pos := 0;
   frmAguarde.Mostra('Alimentando o Relatório ...');
   //-------------------------------------------------------------------------------------
   qryCafCtb.Close;
   qryCafCtb.Open;
   qryCafxContab.First;
   while not qryCafxContab.EOF do
   begin
      frmAguarde.Pos := frmAguarde.Pos + 1;
      if (qryCafxContabVLCAFDEB.AsFloat <> 0) or (qryCafxContabVLCAFCRE.AsFloat <> 0) then
      begin
         if (chkDif.Checked) and ((qryCafxContabVLCAFDEB.AsFloat - qryCafxContabVLCONTABDEB.AsFloat) = 0) and
                                 ((qryCafxContabVLCAFCRE.AsFloat - qryCafxContabVLCONTABCRE.AsFloat) = 0) then
         begin
            qryCafxContab.Next;
            Continue;
         end;
         //-------------------------------------------------------------------------------
         qryCafCtb.Append;
         qryCafCtb.FieldByName('DATA').AsDateTime        := qryCafxContabDATA.AsDateTime;
         qryCafCtb.FieldByName('CONTACONTABIL').AsString := qryCafxContabCONTACONTABIL.AsString;
         qryCafCtb.FieldByName('CENTROCUSTO').AsString   := qryCafxContabCENTROCUSTO.AsString;
         qryCafCtb.FieldByName('VLCONTABDEB').AsCurrency := qryCafxContabVLCONTABDEB.AsCurrency;
         qryCafCtb.FieldByName('VLCONTABCRE').AsCurrency := qryCafxContabVLCONTABCRE.AsCurrency;
         qryCafCtb.FieldByName('VLCAFDEB').AsCurrency    := qryCafxContabVLCAFDEB.AsCurrency;
         qryCafCtb.FieldByName('VLCAFCRE').AsCurrency    := qryCafxContabVLCAFCRE.AsCurrency;
         qryCafCtb.FieldByName('DIFVALDEB').AsCurrency   := (qryCafxContabVLCAFDEB.AsFloat - qryCafxContabVLCONTABDEB.AsFloat);
         qryCafCtb.FieldByName('DIFVALCRE').AsCurrency   := (qryCafxContabVLCAFCRE.AsFloat - qryCafxContabVLCONTABCRE.AsFloat);
      end;
      qryCafxContab.Next;
   end;
   //-------------------------------------------------------------------------------------
   qryCafxContab.CancelUpdates;
   qryCafxContab.Close;
   //-------------------------------------------------------------------------------------
   dtmRelOperCaf.LbPer13.Caption := 'De ' + edDataIni.Text + ' a ' + edDataFim.Text;
   dtmRelOperCaf.rpConsCafContabDbText1.DisplayFormat := trim(IntegraBack.MascaraCC) + ';0; ';
   dtmRelOperCaf.rpConsCafContabDbText2.DisplayFormat := trim(IntegraBack.MascaraPlano) + ';0; ';
   //-------------------------------------------------------------------------------------
   frmAguarde.Apaga;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmParamConsCafContab.cmbGrupoIniExit(Sender: TObject);
begin
   inherited;
   if (cmbGrupoIni.Text <> '') then
   begin
      iGrupoIni := qryGrupoIniIDGRUPO.AsInteger;
   end else
   begin
      iGrupoIni := 0;
   end;
end;
//========================================================================================
procedure TfrmParamConsCafContab.edDataIniExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then
      Exit;
   //-------------------------------------------------------------------------------------
   if (edDataIni.Text = '') then
   begin
      MsgDlg('Forneça a Data Inicial do Periodo a ser analizado!',
             'Erro', mtError, [mbOk], 0);
      edDataIni.SetFocus;
      exit;
   end;
end;
//========================================================================================
procedure TfrmParamConsCafContab.edDataFimExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then
      Exit;
   //-------------------------------------------------------------------------------------
   if (edDataFim.Text = '') then
   begin
      MsgDlg('Forneça a Data Final do Periodo a ser analizado!',
             'Erro', mtError, [mbOk], 0);
      edDataFim.SetFocus;
      exit;
   end;
end;

procedure TfrmParamConsCafContab.GeraTabTemp;
begin
   if FileExists(Sistema.TempDir +'tblTrfCaf.db') then
   begin
      DeleteFile(Sistema.TempDir +'tblTrfCaf.db');
      DeleteFile(Sistema.TempDir +'tblTrfCaf.px');
      DeleteFile(Sistema.TempDir +'tblTrfCaf.val');
   end;
   //-------------------------------------------------------------------------------------
   tblTrfCaf := TTable.Create(Application);
   tblTrfCaf.Active       := False;
   tblTrfCaf.DataBaseName := Copy(Sistema.TempDir,1,Length(Sistema.TempDir)-1);
   tblTrfCaf.TableType    := ttParadox;
   tblTrfCaf.TableName    := 'tblTrfCaf.db';
   tblTrfCaf.FieldDefs.Clear;
   tblTrfCaf.FieldDefs.add('DATA'    ,ftDate   , 0 , False );
   tblTrfCaf.FieldDefs.add('GRUPO'   ,ftInteger, 0 , False );
   tblTrfCaf.FieldDefs.add('TIPOMOV' ,ftInteger, 0 , False );
   tblTrfCaf.FieldDefs.add('VALOR'   ,ftFloat  , 0 , False );
   tblTrfCaf.FieldDefs.add('CONTADB' ,ftString , 18, False );
   tblTrfCaf.FieldDefs.add('CONTACR' ,ftString , 18, False );
   tblTrfCaf.CreateTable;
end;

end.

