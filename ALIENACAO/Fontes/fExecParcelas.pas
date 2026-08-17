{-------------------------------------------------------------------------------

	   Gera os Parcelas do Contrato

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  01/10/2001
	Data de Término   :
        
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: btnContinua1Click
Nº SOL......: 221141
Nº KINTANA..: 2053650
Data........: 18/12/2012
Responsável.: Edilaine Ferraresi
Descrição...: crítica de duplicidade de lançamento na geração de parcelas
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8221
Nº KINTANA..: 1577344
Data........: 20/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27765
Responsável : Daniel Simões
Data        : 17/04/2008
Descrição   : Apenas coloquei uma vírgula na query 'qryCondPag' na condição
              '(CP.TIPOCONDPAG IN ('S','P','R','V') )'
--------------------------------------------------------------------------------
Pendência   : 18795
Responsável : Daniel Simões
Data        : 31/01/2007
Descrição   : Não gera parcelas para "Caução", pois esta já foi gerada na
              proposta.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecParcelas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mComprador, mProposta, fcLabel, fcButton,
  fcImgBtn, fcShapeBtn, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBTables,
  Wwquery, ComCtrls, mResponsavel, Mask, wwdbedit, Wwdbspin,
  mAdministradora,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab,USistema;

type
  TfrmExecParcelas = class(TfrmSairAjudaImob)
    ntbFolha: TNotebook;
    lblTitulo: TfcLabel;
    molProposta1: TmolProposta;
    molComprador1: TmolComprador;
    btnContinua1: TfcShapeBtn;
    Panel4: TPanel;
    dsParcGlobal: TwwDataSource;
    Panel1: TPanel;
    qryProp: TwwQuery;
    qryPropIDCONTRATOIMOVEL: TFloatField;
    qryPropCONNUMERO: TStringField;
    qryPropCONNOME: TStringField;
    qryPropCONDATAINICIO: TDateTimeField;
    qryPropFLGTIPOCONTRATO: TStringField;
    qryPropCONTAXAADMIN: TFloatField;
    qryPropCONVLRAJUSTADO: TFloatField;
    qryPropCONVLRTOTAL: TFloatField;
    qryPropCONDESCRICAO: TMemoField;
    qryPropVLRPROPOSTA: TFloatField;
    qryPropVLRPRESENTE: TFloatField;
    qryPropVLRCONTABIL: TFloatField;
    qryPropCONINDICEMORA: TFloatField;
    qryPropCONINDICEREAJUSTE: TFloatField;
    qryPropCONDATAREAJUSTE: TDateTimeField;
    qryPropPERALUGUELIDEAL: TFloatField;
    dsProp: TwwDataSource;
    qryCondPag: TwwQuery;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    pcParcelas: TPageControl;
    tsContrato: TTabSheet;
    tsParcela: TTabSheet;
    grdContrato: TwwDBGrid;
    btnContinua2: TfcShapeBtn;
    btnCancela2: TfcShapeBtn;
    qryPropRAZAOSOCIAL: TStringField;
    cbSaldoInicial: TCheckBox;
    grdParcelas: TwwDBGrid;
    cbProj: TCheckBox;
    molResponsavel1: TmolResponsavel;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    Label1: TLabel;
    cbIntegra: TCheckBox;
    qryCondPagIDCONDINICIAL: TFloatField;
    qryCondPagDATAVENCTOINICIAL: TDateTimeField;
    qryParcGlobal: TwwQuery;
    qryParcGlobalIDPARCFINANCIMOV: TFloatField;
    qryParcGlobalCODDOCUMENTO: TFloatField;
    qryParcGlobalPLNCODIGO: TFloatField;
    qryParcGlobalIDCONDPAGIMOVEL: TFloatField;
    qryParcGlobalNUMPARCELA: TFloatField;
    qryParcGlobalDATAVENCIMENTO: TDateTimeField;
    qryParcGlobalVLRPRESTACAO: TFloatField;
    qryParcGlobalVLRJUROS: TFloatField;
    qryParcGlobalVLRAMORTIZACAO: TFloatField;
    qryParcGlobalVLRSALDODEVEDOR: TFloatField;
    qryParcGlobalVLRPRESTATUALIZADA: TFloatField;
    qryParcGlobalVLRRESIDUO: TFloatField;
    qryParcGlobalVLRRESIDUOATUALI: TFloatField;
    qryParcGlobalVLRCORRIGIDOATRASO: TFloatField;
    qryParcGlobalVLRMULTAATRASO: TFloatField;
    qryParcGlobalVLRMORAATRASO: TFloatField;
    qryParcGlobalFLGRESIDUOINCORP: TStringField;
    qryParcGlobalFLGTIPOLANC: TFloatField;
    qryParcGlobalFLGLANCINTEGRA: TFloatField;
    qryParcGlobalFLGCONCILIADO: TStringField;
    qryParcGlobalIDINDCORRECAO: TFloatField;
    qryParcGlobalFATORCORRECAO: TFloatField;
    qryParcGlobalIDCONTRATOIMOVEL: TFloatField;
    updParcGlobal: TUpdateSQL;
    qryParcGlobalCAL_TIPO: TStringField;
    molAdministradora1: TmolAdministradora;
    cbRecalculo: TCheckBox;
    cbSalva: TCheckBox;
    qryParcGlobalVLRJUROSPARC: TFloatField;
    qryParcGlobalVLRNOMINAL: TFloatField;
    qryParcGlobalVLRSALDOATUAL: TFloatField;
    qryParcGlobalVLRCORRSALDO: TFloatField;
    GroupBox2: TGroupBox;
    cbContrato: TCheckBox;
    cbAcordo: TCheckBox;
    qryCondPagTIPOCONDPAG: TStringField;
    qryAux: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    MemoField1: TMemoField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    DateTimeField2: TDateTimeField;
    FloatField10: TFloatField;
    procedure btnContinua1Click(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pcParcelasChange(Sender: TObject);
    procedure btnCancela2Click(Sender: TObject);
    procedure ntbFolhaPageChanged(Sender: TObject);
    procedure btnContinua2Click(Sender: TObject);
    procedure molComprador1btnBuscaFornClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure grdContratoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdContratoTopRowChanged(Sender: TObject);
    procedure qryParcGlobalCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     CtrlContab       : TCtrlContab;//Helen - SOL: 172902/8221 KTN: 1577344
     iPeriodo_Final   : Integer;    //Helen - SOL: 172902/8221 KTN: 1577344
     sContrato        : String;     //Helen - SOL: 172902/8221 KTN: 1577344
    { Private declarations }
    procedure Sel;                        // Abre as tabelas utilizadas no Form
    function  ProcuraParcelas: Boolean;   // Abre as parcelas geradas e previstas anteriormente
  public
    { Public declarations }
  end;

var
  frmExecParcelas: TfrmExecParcelas;

implementation

uses DFinanciamento, UFuncoesImob, uMensErro, uDatabase, dBaseDados,
     UDiasInUteis, UFuncAlienacao;

{$R *.DFM}

procedure TfrmExecParcelas.btnContinua1Click(Sender: TObject);
var iCondPag: Double;
    dDataIni: TDateTime;
    sAno, sMes : String;
    iPeriodo   : Integer; //Helen - SOL: 172902/8221 KTN: 1577344
begin
   inherited;
   //Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   iPeriodo       := 0;
   sContrato      := '';
   iPeriodo_Final := 0;
   //Helen - SOL: 172902/8221 KTN: 1577344 - Fim

   sAno := IntToStr(trunc(DBspnAno.Value));
   sMes := IntToStr(cboMes.ItemIndex + 1);
   if length(sMes) = 1 then sMes := '0' + sMes;

   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,'01/'+smes+'/'+sano) then
   begin
      MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
      Exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   // Calcula as parcelas de cada condição de pagamento de cada contrato selecionado
   Sel;
   LimpaParametros(dtmFinanciamento.qryParc);

   if not qryProp.Eof then  begin       // edilaine.ferraresi - SOL 221141 / KTN 2053650

      // edilaine.ferraresi - SOL 221141 / KTN 2053650
      // Procura as parcelas geradas e previstas anteriormente
      if not cbSalva.Checked then begin
         if not ProcuraParcelas then Exit;
      end;
      // edilaine.ferraresi - SOL 221141 / KTN 2053650 - fim

      qryProp.First;
      while not qryProp.eof do begin
          LimpaParametros(qryCondPag);
          qryCondPag.ParamByName('pIDCONTRATOIMOVEL').AsFloat := qryPropIDCONTRATOIMOVEL.AsFloat;
          if not cbRecalculo.Checked then
            qryCondPag.ParamByName('pDATAFIM').AsString := sAno + sMes;
          if cbSalva.Checked then ProcuraParcelas;
          qryCondPag.Open;
          // edilaine.ferraresi - SOL 221141 / KTN 2053650
          {se não existe condição de pagto para contrato, passar para próximo}
          if qryCondPag.eof then begin
             qryProp.next;
             continue;
          end;
          // edilaine.ferraresi - SOL 221141 / KTN 2053650 - fim

          qryCondPag.First;
          while not qryCondPag.eof do begin
             iCondPag := qryCondPagIDCONDINICIAL.AsFloat;
             dDataIni := qryCondPagDATAVENCTOINICIAL.AsDateTime;

             if (qryCondPagTIPOCONDPAG.AsString<>'C') then begin
                FuncAlienacao.GeraParcela(iCondPag, dDataIni,
                                          DiasInUteis.UltDiaMes(word(trunc(DBspnAno.Value)), cboMes.ItemIndex + 1),
                                          frmExecParcelas.qryParcGlobal);
             end;

             qryCondPag.Next;
          end;
          qryParcGlobal.Filtered := False;
          qryParcGlobal.Filter := 'IDCONTRATOIMOVEL = '+ qryPropIDCONTRATOIMOVEL.AsString;
          qryParcGlobal.Filtered := True;
          if not qryParcGlobal.IsEmpty then   // edilaine.ferraresi - SOL 221141 / KTN 2053650
             qryParcGlobal.First;
          while not qryParcGlobal.eof do
          begin
               //if (pos('Integrad', qryParcGlobalCAL_TIPO.Value) = 0)  AND        // edilaine.ferraresi - SOL 221141 / KTN 2053650 - comentado
               //   (pos('Saldo Inicial', qryParcGlobalCAL_TIPO.Value) = 0)  then  // edilaine.ferraresi - SOL 221141 / KTN 2053650 - comentado

               {verifica bloqueio apenas de parcelas geradas e projetadas}
               if (pos('Parc. Gerada', qryParcGlobalCAL_TIPO.Value) > 0) or        // edilaine.ferraresi - SOL 221141 / KTN 2053650
                  (pos('Parc. Projetada', qryParcGlobalCAL_TIPO.Value) > 0) then   // edilaine.ferraresi - SOL 221141 / KTN 2053650
               begin
                  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryParcGlobalDATAVENCIMENTO.AsString) then
                  begin
                     if sContrato <> '' then
                        sContrato := sContrato + ' - ' ;
                     sContrato := sContrato + qryPropCONNUMERO.AsString ;
                     iPeriodo_Final := 1;
                     break;
                  end;
               end;
               qryParcGlobal.next;
          end;
          qryParcGlobal.Filtered := False;
          qryParcGlobal.Filter := '';
          //qryParcGlobal.Filtered := True;      // edilaine.ferraresi - SOL 221141 / KTN 2053650 - comentado
          qryProp.Next;
      end;
      if {(cbSalva.Checked) and} (sContrato <> '' ) then     // edilaine.ferraresi - SOL 221141 / KTN 2053650
      begin
         MsgDlg('Não será possível a Geração das Parcelas, com os Filtro selecionado.'  +#13+
                'Os contrato a seguir contem parcelas com Período contábil bloqueado: ' +#13+
                (sContrato) , 'Erro', mtError, [mbok], 0);
         exit;
      end;
      qryParcGlobal.Close;
      //qryParcGlobal.Open;   // edilaine.ferraresi - SOL 221141 / KTN 2053650 - comentado
   end;    // edilaine.ferraresi - SOL 221141 / KTN 2053650
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

   // Desabilita os CheckBoxes
   btnContinua2.Enabled   := False;
   btnCancela2.Enabled    := False;
   cbSaldoInicial.Enabled := False;
   cbProj.Enabled         := False;
   cbIntegra.Enabled      := False;

   // Abre as tabelas
   Sel;
   LimpaParametros(dtmFinanciamento.qryParc);
   if not qryProp.IsEmpty then begin
      if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

      // Procura as parcelas geradas e previstas anteriormente
      if not cbSalva.Checked then begin
         if not ProcuraParcelas then Exit;
      end;

      ntbFolha.ActivePage    := 'Confirma';
      pcParcelas.ActivePage  := tsContrato;
      // Calcula as parcelas de cada condição de pagamento de cada contrato selecionado
      qryProp.First;
      while not qryProp.eof do begin
         LimpaParametros(qryCondPag);
         qryCondPag.ParamByName('pIDCONTRATOIMOVEL').AsFloat := qryPropIDCONTRATOIMOVEL.AsFloat;
         if not cbRecalculo.Checked then
           qryCondPag.ParamByName('pDATAFIM').AsString := sAno + sMes;

         if cbSalva.Checked then ProcuraParcelas;

         qryCondPag.Open;
         qryCondPag.First;
         while not qryCondPag.eof do begin
            iCondPag := qryCondPagIDCONDINICIAL.AsFloat;
            dDataIni := qryCondPagDATAVENCTOINICIAL.AsDateTime;

            if (qryCondPagTIPOCONDPAG.AsString<>'C') then begin // Daniel - 18795
               FuncAlienacao.GeraParcela(iCondPag, dDataIni,
                                         DiasInUteis.UltDiaMes(word(trunc(DBspnAno.Value)), cboMes.ItemIndex + 1),
                                         frmExecParcelas.qryParcGlobal);
            end;

            qryCondPag.Next;
         end;
         if cbSalva.Checked then begin
           try

                 qryParcGlobal.ApplyUpdates;
                 qryParcGlobal.CommitUpdates;
                 CommitTransacao;
           except
              raise;
              MsgDlg('Erro ao Gerar Parcelas','Erro',mtError,[mbOk],0);
           end;
         end;
         qryProp.Next;
      end;

      // Habilita os CheckBoxes
      btnContinua2.Enabled  := True;
      cbSaldoInicial.Enabled:= True;
      cbProj.Enabled        := True;
      cbIntegra.Enabled     := True;
   end else begin
      MsgDlg('Nenhum contrato foi selecionado','Erro',mtError,[mbOK],0);
   end;
   btnCancela2.Enabled   := True;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if (cbSalva.Checked) and (sContrato <> '' ) then
      MsgDlg('Erro ao gerar a parcela para os contratos: ' + (sContrato) + '.' +#13+
             'Período contábil bloqueado. Data Vencimento.', 'Erro', mtError, [mbok], 0);
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
end;

procedure TfrmExecParcelas.Sel;
begin
   // Abre a tabela com os contratos selecionados
   LimpaParametros(qryProp);
   if molproposta1.iProposta > 0 then
      qryProp.ParamByName('pIDCONTRATOIMOVEL').AsFloat := molproposta1.iProposta;
   if molComprador1.iComprador > 0 then
      qryProp.ParamByName('pIDLOCATARIO').AsFloat      := molComprador1.iComprador;
   if molResponsavel1.iResponsavel > 0 then
      qryProp.ParamByName('pIDRESPONSAVEL').AsFloat    := molResponsavel1.iResponsavel;
   if molAdministradora1.iAdministradora > 0 then
      qryProp.ParamByName('pIDADMINIMOVEL').AsFloat    := molAdministradora1.iAdministradora;

   if cbContrato.Checked then qryProp.ParamByName('pFLGCONTRATO').AsString := 'S';
   if cbAcordo.Checked   then qryProp.ParamByName('pFLGACORDO').AsString   := 'S';

   qryProp.Open;
end;

procedure TfrmExecParcelas.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,True,Sender);
end;

procedure TfrmExecParcelas.FormShow(Sender: TObject);
begin
   inherited;
   ntbFolha.ActivePage := 'Selecao';

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);
end;

procedure TfrmExecParcelas.pcParcelasChange(Sender: TObject);
begin
   inherited;

   // Ajusta os filtros de acordo com os checkboxes marcados
   with qryParcGlobal do begin
      DisableControls;
      Filtered := False;
      Filter := 'IDCONTRATOIMOVEL = ' + IntToStr(qryPropIDCONTRATOIMOVEL.AsInteger);
      if not cbSaldoInicial.Checked then begin
         Filter := Filter + ' AND NUMPARCELA > 0';
      end;
      if not cbProj.Checked then begin
         Filter := Filter + ' AND FLGTIPOLANC <> 4';
      end;
      if not cbIntegra.Checked then begin
         Filter := Filter + ' AND FLGLANCINTEGRA < 2';
      end;
      Filtered := True;
      EnableControls;
   end;
end;

procedure TfrmExecParcelas.btnCancela2Click(Sender: TObject);
begin
  inherited;
  ntbFolha.ActivePage := 'Selecao';
end;

procedure TfrmExecParcelas.ntbFolhaPageChanged(Sender: TObject);
begin
   inherited;
   if ntbFolha.ActivePage = 'Selecao' then begin
      lblTitulo.Caption := 'Geração de Parcelas [Seleção]';
   end else begin
      lblTitulo.Caption := 'Geração de Parcelas [Confirmação]';
   end;
end;


function TfrmExecParcelas.ProcuraParcelas : Boolean;
var sCond : String;
begin
   Result := True;

   // Monta a clausula IN para cada contrato selecionado
   if not cbSalva.Checked then begin
      qryProp.DisableControls;
      sCond := 'AND IDCONTRATOIMOVEL IN(';
      qryProp.First;
      while not qryProp.EOF do begin
         sCond := sCond + FormatFloat('#0',qryPropIDCONTRATOIMOVEL.asFloat)+',';
         qryProp.Next;
      end;
      sCond := Copy(sCond,1,Length(sCond)-1) + ')';
      qryProp.First;
      qryProp.EnableControls;
   end else begin
      sCond := 'AND IDCONTRATOIMOVEL = ' + FloatToStr(qryPropIDCONTRATOIMOVEL.AsFloat);
   end;

   // Monta o Select do Sql
   qryParcGlobal.Close;
   with qryParcGlobal.sql do begin
      clear;
      Add('SELECT');
      Add('     PF.IDPARCFINANCIMOV,');
      Add('     PF.CODDOCUMENTO,');
      Add('     PF.PLNCODIGO,');
      Add('     PF.IDCONDPAGIMOVEL,');
      Add('     PF.NUMPARCELA,');
      Add('     PF.DATAVENCIMENTO,');
      Add('     PF.VLRPRESTACAO,');
      Add('     PF.VLRNOMINAL,');
      Add('     PF.VLRJUROS,');
      Add('     PF.VLRJUROSPARC,');
      Add('     PF.VLRAMORTIZACAO,');
      Add('     PF.VLRSALDODEVEDOR,');
      Add('     PF.VLRSALDOATUAL,');
      Add('     PF.VLRPRESTATUALIZADA,');
      Add('     PF.VLRRESIDUO,');
      Add('     PF.VLRRESIDUOATUALI,');
      Add('     PF.VLRCORRSALDO,');      
      Add('     PF.VLRCORRIGIDOATRASO,');
      Add('     PF.VLRMULTAATRASO,');
      Add('     PF.VLRMORAATRASO,');
      Add('     NVL(PF.FLGRESIDUOINCORP,''N'') AS FLGRESIDUOINCORP,');
      Add('     PF.FLGTIPOLANC,');
      Add('     PF.FLGCONCILIADO,');
      Add('     PF.FLGLANCINTEGRA,');
      Add('     PF.IDINDCORRECAO,');
      Add('     PF.FATORCORRECAO,');
      Add('     CP.IDCONTRATOIMOVEL');
      Add('FROM');
      Add('     PARCFINANCIMOV PF,');
      Add('     CONDPAGIMOVEL  CP');
      Add('WHERE');
      Add('     CP.IDCONDPAGIMOVEL = PF.IDCONDPAGIMOVEL');
      Add(sCond);
      Add('ORDER BY PF.IDCONDPAGIMOVEL, PF.DATAVENCIMENTO, PF.FLGTIPOLANC');
   end;

   try
      qryParcGlobal.Open;
   except
      MsgDlg('Não foi possível abrir as parcelas existentes','Erro',mtError,[mbOK],0);
      Result := False;
   end;
end;

procedure TfrmExecParcelas.btnContinua2Click(Sender: TObject);
begin
   inherited;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if (iPeriodo_Final = 1 ) then
   begin
      MsgDlg('Não será possível a Geração das Parcelas, com o Filtro selecionado.'  +#13+
             'Os contratoS a seguir contem parcelas com Período contábil bloqueado: ' +#13+
             (sContrato) , 'Erro', mtError, [mbok], 0);
      exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
   // Desabilita os filtros e Aplica as alterações no Banco
   qryParcGlobal.DisableControls;
   qryParcGlobal.Filtered := False;
   try
      try
         qryParcGlobal.ApplyUpdates;
         qryParcGlobal.CommitUpdates;
         CommitTransacao;
         MsgDlg('Parcelas geradas com sucesso','Informação',mtInformation,[mbOk],0);
      except
         raise;
         MsgDlg('Erro ao Gerar Parcelas','Erro',mtError,[mbOk],0);
      end;
   finally
      // Reahilita os filtros
      btnContinua2.Enabled   := False;
      qryParcGlobal.Filtered := True;
      qryParcGlobal.EnableControls;
      ntbFolha.PageIndex := 0;
   end;
end;

procedure TfrmExecParcelas.molComprador1btnBuscaFornClick(Sender: TObject);
begin
   inherited;
   molComprador1.btnBuscaFornClick(Sender);
end;

procedure TfrmExecParcelas.bbtnSairClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
end;

procedure TfrmExecParcelas.grdContratoCalcCellColors(Sender: TObject;
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

procedure TfrmExecParcelas.grdContratoTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecParcelas.qryParcGlobalCalcFields(DataSet: TDataSet);
begin
  inherited;
   // Busca o tipo de parcela
   qryParcGlobalCAL_TIPO.AsString :=
               FuncAlienacao.TipoParcela(qryParcGlobalFLGTIPOLANC.AsInteger,
                                         qryParcGlobalFLGLANCINTEGRA.AsInteger);
end;

procedure TfrmExecParcelas.FormCreate(Sender: TObject);
begin
  inherited;
  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
end;

procedure TfrmExecParcelas.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
end;

end.
