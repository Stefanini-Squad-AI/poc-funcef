{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 26054
Data........: 26/12/2016
Responsável.: Michelle Suellyn Mota(Layout) / Darivaldo Alencar(Codificação)
Descrição...: Criação da tela Gestão de Investimento - Imóvel.
--------------------------------------------------------------------------------}

unit fCadGestInvestImovelMestreMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, DBCtrls, Mask, DBCtrls2, Db, DBTables,
  Wwquery, CmEventosCadastro, ImgList, MontaSelect, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCtrlGestInvestImovel,
  CheckLst, uCmSqlParams, uCMClientDataSet, TREdit, DBGrids, uCMTypes,
  wwdbedit,UDataBase,uSistema;

type
  TfrmCadGestInvestImovelMestreMT = class(TfrmCadMestreDetalheCS)
    lblVoto: TLabel;
    edtVoto: TDBEdit2;
    Label1: TLabel;
    edtResAta: TDBEdit2;
    grpSelImovel: TGroupBox;
    lblImovelMestre: TLabel;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;
    btnIncluirImovelMestre: TBitBtn;
    pnlImovelMestre: TPanel;
    pnlUnidade: TPanel;
    lblFornecedor: TLabel;
    btnBuscaFornecedor: TBitBtn;
    btnLimpaFornecedor: TBitBtn;
    lblTipo: TLabel;
    lblValor: TLabel;
    dbmmoDescricao: TDBMemo;
    lblDescricao: TLabel;
    pnlBottom: TPanel;
    lblSaldo: TLabel;
    lblNroDoc: TLabel;
    btnBuscaDoc: TBitBtn;
    btnLimpaDoc: TBitBtn;
    lblNroAP: TLabel;
    lblStatus: TLabel;
    lblValorPago: TLabel;
    lblDataIni: TLabel;
    edtDataIni: TCMDateTimePicker;
    MontaSelectImovelMestre: TMontaSelect;
    dbcbbTIPO: TDBComboBox;
    lstImovelMestre: TListView;
    qryDet: TwwQuery;
    qryAux: TwwQuery;
    MontaSelectFornec: TMontaSelect;
    MontaSelectDocVoto: TMontaSelect;
    edtValor: TDBRealEdit;
    edtValorPago: TDBRealEdit;
    edtFornecedor: TEdit;
    edtNroDoc: TwwDBEdit;
    edtNroAP: TwwDBEdit;
    edtStatus: TwwDBEdit;
    edtImovelMestre: TEdit;
    qryDetDATAEMISSAO: TDateTimeField;
    qryDetNODOCUMENTO: TFloatField;
    qryDetNUMAPGR: TFloatField;
    qryDetVALOR: TFloatField;
    qryDetIDDOCUMENTOXVOTO: TFloatField;
    qryDetSALDO: TFloatField;
    updDet: TUpdateSQL;
    qryImoveisXVoto: TwwQuery;
    qryDetIDVOTOGESTAOIMOVEL: TFloatField;
    qryDetCODDOCUMENTO: TFloatField;
    cdsImovel: TCMClientDataSet;
    cdsImovelIDIMOVEL: TIntegerField;
    cdsImovelFLGMARCADO: TBooleanField;
    qryDetSTATUS: TStringField;
    qryDetNUMLANCTO: TFloatField;
    cdsIMP: TCMClientDataSet;
    cdsIMPIDIMOVEL: TIntegerField;
    qryAux2: TwwQuery;
    ScbxUnidade: TScrollBox;
    lstUnidades: TListView;
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirImovelMestreClick(Sender: TObject);
    procedure lstImovelMestreClick(Sender: TObject);
    procedure btnBuscaFornecedorClick(Sender: TObject);
    procedure btnBuscaDocClick(Sender: TObject);
    procedure btnLimpaFornecedorClick(Sender: TObject);
    procedure btnLimpaDocClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CarregaImoveis(sIdVoto : string);
    procedure MontaSelectDocVotoBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure LimpaCamposDet;
    procedure LimpaCamposMaster;
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure RecalcularSaldo;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure edtValorPagoKeyPress(Sender: TObject; var Key: Char);
    procedure lstUnidadesChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    iFornecedor,
    iDocumento,
    iIdImovelMestre,
    iIdVotoGestaoImovel,
    iIdDocumentoxvoto,
    iChaveDS,
    iQtdeLin,
    iIdImoveisXVoto: Integer;
    dVlrPago,
    dSaldo: Double;
    bDeletando,
    bErro,
    bAtualizaCds: boolean;
    Status: TDatasetstate;
    sIdImovelSelect: String;
    CtrlGestInvestImovel: TCtrlGestInvestImovel;
    aDetalhe: Array[1..9] of string;
    procedure CarregaLvMestre;
    procedure CarregaLvUnidade;
    procedure ChecaUnidadesMarcadas(iTpBusca: Integer);
    procedure LimpaGrid;
    procedure ExluiItemCancelado;
    function CancelarAlterarDetalhe: boolean;
    Procedure PovoaCds;
    Procedure ConfirmacaoTransacao;
    Procedure AtivaUnidade;
  public
    { Public declarations }
  end;

var
  frmCadGestInvestImovelMestreMT: TfrmCadGestInvestImovelMestreMT;


implementation

uses
  dBaseDados, uMensErro, uComunsImobiliario;

{$R *.DFM}

procedure TfrmCadGestInvestImovelMestreMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGestInvestImovel := TCtrlGestInvestImovel.Create;

  Self.Height := 800;
  Self.Width := 740;

  qry.prepare;
  qryDet.Prepare;

  qry.close;
  qry.open;

  qryDet.close;
  qryDet.open;

  bDeletando:= False;
  cdsImovel.CreateDataSet;
  cdsIMP.CreateDataSet;
end;

procedure TfrmCadGestInvestImovelMestreMT.btnBuscaImovelMestreClick(
  Sender: TObject);
begin
  //inherited;
  MontaSelectImovelMestre.Executar;
  if MontaSelectImovelMestre.RetornouValor then
    begin
      edtImovelMestre.Text := MontaSelectImovelMestre.ValoresChave[0];
      iIdImovelMestre := StrToInt(MontaSelectImovelMestre.ValoresChave[1]);
    end;
end;

procedure TfrmCadGestInvestImovelMestreMT.btnLimpaImovelMestreClick(
  Sender: TObject);
begin
  inherited;
  edtImovelMestre.Clear;
end;

procedure TfrmCadGestInvestImovelMestreMT.btnIncluirImovelMestreClick(
  Sender: TObject);
Var
  ItemI: TListItem;
begin
  inherited;
  AtivaUnidade;
  //Inclusão de novos imóveis mestre
  if (edtImovelMestre.Text<> EmptyStr) then
     begin
        ItemI := lstImovelMestre.Items.Add;
        ItemI.Caption := edtImovelMestre.Text;
        ItemI.SubItems.Add(IntToStr(iIdImovelMestre));
        ItemI.SubItems.Add(edtImovelMestre.Text);
        ChecaUnidadesMarcadas(5);//Inclusão do novo imóvel principal

        FazQuery(qryAux,CtrlGestInvestImovel.getListaImoveisUnidadeDoMestre(IntToStr(iIdImovelMestre)));

        CarregaLvUnidade;
        ChecaUnidadesMarcadas(3);
     end;
end;

procedure TfrmCadGestInvestImovelMestreMT.lstImovelMestreClick(
  Sender: TObject);
begin
  inherited;
  //Carregar unidades de acordo com imóvel mestre ao clicar no mestre
  if (lstImovelMestre.Items.Count > 0)then
     begin
        if (lstImovelMestre.Selected <> nil) then
           begin
              sIdImovelSelect := lstImovelMestre.Selected.SubItems[0];
              FazQuery(qryAux,CtrlGestInvestImovel.getListaImoveisUnidadeDoMestre(sIdImovelSelect));
              CarregaLvUnidade;
              AtivaUnidade;
              ChecaUnidadesMarcadas(2);
           end;
     end;
end;

procedure TfrmCadGestInvestImovelMestreMT.btnBuscaFornecedorClick(Sender: TObject);
begin
  inherited;
  MontaSelectFornec.Executar;
  if (MontaSelectFornec.RetornouValor) then
    begin
      iFornecedor := StrToInt(MontaSelectFornec.valoreschave[0]);
      edtFornecedor.Text := MontaSelectFornec.valoreschave[1];
    end;
end;

procedure TfrmCadGestInvestImovelMestreMT.btnBuscaDocClick(
  Sender: TObject);
begin
 inherited;
  MontaSelectDocVoto.Executar;
  if (MontaSelectDocVoto.retornouvalor) then
    begin
      Status := qryDet.State;
      RecalcularSaldo;//atualiza fSaldo antes do Insert

      iDocumento := StrToInt(MontaSelectDocVoto.valoreschave[5]);

      if(Status <> dsEdit) then
        qryDet.Append
      else begin
        qryDet.Edit;
        iIdDocumentoxvoto:= StrToInt(aDetalhe[7]);
      end;

      qryDet.FieldByName('NODOCUMENTO').asString:=  MontaSelectDocVoto.valoreschave[0];
      qryDet.FieldByName('DATAEMISSAO').asString:=  MontaSelectDocVoto.valoreschave[1];
      qryDet.FieldByName('NUMAPGR').asString    :=  MontaSelectDocVoto.valoreschave[2];
      qryDet.FieldByName('VALOR').asString      :=  MontaSelectDocVoto.valoreschave[3];
      qryDet.FieldByName('STATUS').asString     :=  MontaSelectDocVoto.valoreschave[4];
      qryDet.FieldByName('NUMLANCTO').asString  :=  MontaSelectDocVoto.valoreschave[6];
      qryDet.FieldByName('SALDO').asFloat       :=  dSaldo - qryDet.FieldByName('VALOR').asFloat ;
      qryDet.FieldByName('IDDOCUMENTOXVOTO').asInteger  := iIdDocumentoxvoto;
      qryDet.FieldByName('IDVOTOGESTAOIMOVEL').AsInteger:= iIdVotoGestaoImovel;
      qryDet.FieldByName('CODDOCUMENTO').AsInteger      := iDocumento;

      if (Status = dsEdit) then
        begin
           //deixa campo com maior valor para proximo que for incluído
           iIdDocumentoxvoto   := CtrlGestInvestImovel.GetProxCod('DOCUMENTOXVOTO', 'IDDOCUMENTOXVOTO');
        end
      else iIdDocumentoxvoto := iIdDocumentoxvoto + 1;
      RecalcularSaldo;//Atualiza a label  depois do insert
    end;
end;

procedure TfrmCadGestInvestImovelMestreMT.btnLimpaFornecedorClick(Sender: TObject);
begin
  inherited;
  edtFornecedor.Clear;
  iFornecedor := 0;
end;

procedure TfrmCadGestInvestImovelMestreMT.btnLimpaDocClick(
  Sender: TObject);
begin
  inherited;
  iDocumento := 0;
  if (qryDet.State in [dsInsert,dsEdit]) then
     qryDet.fieldbyname('NODOCUMENTO').asString:= EmptyStr;
end;

procedure TfrmCadGestInvestImovelMestreMT.FormShow(Sender: TObject);
begin
  inherited;
  LimpaCamposMaster;
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeCadastroDelete(
  Sender: TObject);
begin
   ExecutarQuery(qryAux,'DELETE FROM IMOVEISXVOTO   WHERE IDVOTOGESTAOIMOVEL = ' + IntToStr(iIdVotoGestaoImovel) );
   ExecutarQuery(qryAux,'DELETE FROM DOCUMENTOXVOTO WHERE IDVOTOGESTAOIMOVEL = ' + IntToStr(iIdVotoGestaoImovel) );
   inherited;

   LimpaCamposMaster;
   FazQuery(qryDet,CtrlGestInvestImovel.ListDocGrid( '-1' ));
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeDetalheConfirma(
  Sender: TObject);
begin
  if not bDeletando then
    begin
      if (dVlrPago > edtValor.Value)then
        begin
          MsgDlg('Não é possível realizar o lançamento da AP. AP maior que o saldo!', 'Aviso', mtWarning, [mbOK], 0);
          qryDet.CancelUpdates;
          FazerVoltarDet;
          abort;
        end;
    end;

  inherited;

  RecalcularSaldo;
end;

procedure TfrmCadGestInvestImovelMestreMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlGestInvestImovel);
  FreeAndNil(cdsImovel);
  FreeAndNil(CdsIMP);
  qry.close;
  qryDet.close;
  qry.unPrepare;
  qryDet.unPrepare;
end;

procedure TfrmCadGestInvestImovelMestreMT.CarregaImoveis(sIdVoto : string);
begin
  //Imóvel Mestre
  FazQuery(qryAux,CtrlGestInvestImovel.getImoveisMestres(sIdVoto));
  CarregaLvMestre;

  //Unidades
  FazQuery(qryAux,CtrlGestInvestImovel.getImoveisUnidades(sIdVoto));
  CarregaLvUnidade;

  //Marca os Checkboxes
  FazQuery(qryAux,CtrlGestInvestImovel.getImoveisChecados(sIdVoto));
  ChecaUnidadesMarcadas(1);

  //Atualiza Grid
  FazQuery(qryDet, CtrlGestInvestImovel.ListDocGrid(sIdVoto ));
end;

procedure TfrmCadGestInvestImovelMestreMT.MontaSelectDocVotoBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
var
  sFiltro, sPart : string;
  i, j, k: Integer;
begin

  sPart := MontaSelectDocVoto.Text;
  i := pos('WHERE', sPart);
  j := pos('ORDER BY', sPart);
  k := j-i;
  sFiltro := Copy(sPart,i,k);
  sFiltro := sFiltro + ' AND (LD.OPERACAO <> 5) ';

  sqlText := CtrlGestInvestImovel.getQueryMS(sFiltro);

  inherited;
end;

procedure TfrmCadGestInvestImovelMestreMT.LimpaCamposDet;
begin
  iDocumento := 0;
end;

procedure TfrmCadGestInvestImovelMestreMT.LimpaCamposMaster;
begin
  dSaldo := 0;
  lblSaldo.Caption := 'Saldo:  0000000,00';
  edtImovelMestre.Clear;
  lstImovelMestre.Items.Clear;
  lstUnidades.Items.Clear;
  edtFornecedor.Clear;
  iFornecedor := 0;
  LimpaCamposDet;
  Application.ProcessMessages;
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeCadastroCancel(
  Sender: TObject);
begin
  inherited;
  qry.Cancel;
  qryDet.Cancel;
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeDetalheCancel(
  Sender: TObject);
begin
  inherited;
  qryDet.Cancel;
end;

procedure TfrmCadGestInvestImovelMestreMT.edtValorChange(Sender: TObject);
begin
  inherited;
  RecalcularSaldo;  
end;

procedure TfrmCadGestInvestImovelMestreMT.RecalcularSaldo;
begin
  dSaldo  := edtValor.Value;
  Status  := qryDet.State;
  iChaveDS:= qryDet.FieldByName('IDDOCUMENTOXVOTO').AsInteger;
  with qryDet do
    begin
      First;
      if IsEmpty then
         lblsaldo.caption := 'Saldo:  0000000,00';

      while not Eof do
        begin
          dSaldo := dSaldo - FieldByName('VALOR').asFloat;
          Edit;
          FieldByName('SALDO').asFloat:= dSaldo;
          Post;
          Next;
        end
    end;

   lblsaldo.caption := 'Saldo:  '+ FormatFloat('#,##0.00',dSaldo);

   if (Status = dsEdit) then
     begin
        qryDet.Locate('IDDOCUMENTOXVOTO',IntToStr(iChaveDS),[]);
        qryDet.edit;
     end
   else qryDet.Locate('IDDOCUMENTOXVOTO',IntToStr(iIdDocumentoxvoto -1),[]);
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  cdsImovel.EmptyDataSet;
  cdsIMP.EmptyDataSet;
  LimpaCamposMaster;

  if MontaSelect.RetornouValor then
    begin
      sIdImovelSelect := EmptyStr;
      iIdVotoGestaoImovel := StrToInt(MontaSelect.ValoresChave[0]);
      FazQuery(qry,CtrlGestInvestImovel.ListVoto(IntToStr(iIdVotoGestaoImovel)));
      dSaldo := qry.FieldByName('VLRAPROVADO').AsFloat;

      FazQuery(qryAux,'select nome from pessoa where idpessoa = ' + qry.fieldbyname('idpessoa').AsString);
      edtFornecedor.Text := qryAux.fieldbyname('NOME').AsString;

      CarregaImoveis(IntToStr(iIdVotoGestaoImovel));
    end;

  RecalcularSaldo;
  lstUnidades.Enabled:= False;
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dSaldo := 0;
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
   Accept := True;
  if (edtVoto.Text = EmptyStr) then
    begin
      MsgDlg('É necessário informar o Voto.', 'Aviso', mtWarning, [mbOK], 0);
      Accept := False;
      edtVoto.SetFocus;
    end;

  if (lstImovelMestre.Items.Count = 0) then
    begin
      MsgDlg('É necessário existir um Imóvel Mestre na lista.', 'Aviso', mtWarning, [mbOK], 0);
      Accept := False;
      edtImovelMestre.SetFocus;
    end;

  if (edtFornecedor.Text = EmptyStr) then
    begin
      MsgDlg('É necessário informar o Fornecedor.', 'Aviso', mtWarning, [mbOK], 0);
      Accept := False;
      edtFornecedor.SetFocus;
    end;

  if (edtValor.value = 0) then
    begin
      MsgDlg('É necessário informar o Valor Aprovado.', 'Aviso', mtWarning, [mbOK], 0);
      Accept := False;
      edtValor.SetFocus;
    end;

  if (dbmmoDescricao.Text = EmptyStr) then
    begin
      MsgDlg('É necessário informar a Descrição.', 'Aviso', mtWarning, [mbOK], 0);
      Accept := False;
      dbmmoDescricao.SetFocus;
    end;

  if (lstUnidades.Items.Count = 0) then
    begin
      MsgDlg('É necessário marcar pelo menos uma Unidade.', 'Aviso', mtWarning, [mbOK], 0);
      Accept := False;
    end;

  bErro:= not Accept;
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeCadastroConfirma(
  Sender: TObject);
var
  bLimpar: boolean;
  iRecNo: Integer;

procedure DeletaImovel(sId: String);
begin
  if (CmeCadastro.Operacao = opAlterar) then
       ExecutarQuery(qryAux,'DELETE FROM IMOVEISXVOTO WHERE IDIMOVEL = ' + sId);
end;

begin
   if (bErro) then
      exit;

   bLimpar:= qry.State = dsInsert;
   if qry.State in [dsInsert,dsEdit] then
   begin
      try
         StartTransacao;
         bDeletando:= false;
         if (qry.State in [dsInsert,dsEdit]) then
           begin
             if (iFornecedor<> 0) then
                qry.fieldbyname('IDPESSOA').AsInteger := iFornecedor;
           end;

         iIdImoveisXVoto := CtrlGestInvestImovel.GetProxCod('IMOVEISXVOTO', 'IDIMOVEISXVOTO');

         qry.ApplyUpdates;
         qryDet.ApplyUpdates;

          //Add os imóveis
          if not(cdsIMP.IsEmpty) then
            begin
                ExecutarQuery(qryAux,'INSERT INTO IMOVEISXVOTO(IDIMOVEISXVOTO,IDVOTOGESTAOIMOVEL,IDIMOVEL)  '+
                                     'VALUES (' +
                                      IntToStr(iIdImoveisXVoto) +',' +
                                      IntToStr(iIdVotoGestaoImovel)+','+
                                      cdsIMP.fieldbyname('IDIMOVEL').asstring +
                                     ')');
                iIdImoveisXVoto := iIdImoveisXVoto + 1;
               cdsIMP.EmptyDataSet;
            end;

          //Add unidades
          if (cdsImovel.IsEmpty) then
              PovoaCds;

          ChecaUnidadesMarcadas(4);

          cdsImovel.First;
          FazQuery(qryAux2,CtrlGestInvestImovel.getImoveisChecados(IntToStr(iIdVotoGestaoImovel)));
          while not(cdsImovel.Eof) do
            begin
              if (cdsImovel.FieldByName('FLGMARCADO').asBoolean = True) then
                begin
                  if not(qryAux2.Locate('IDIMOVEL',cdsImovel.FieldByName('IDIMOVEL').asString,[])) then
                    begin
                        ExecutarQuery(qryAux,'INSERT INTO IMOVEISXVOTO(IDIMOVEISXVOTO,IDVOTOGESTAOIMOVEL,IDIMOVEL)  '+
                                             'VALUES (' +
                                              IntToStr(iIdImoveisXVoto) +',' +
                                              IntToStr(iIdVotoGestaoImovel)+','+
                                              cdsImovel.FieldByName('IDIMOVEL').AsString +
                                             ')' );
                        iIdImoveisXVoto := iIdImoveisXVoto + 1;
                    end;
                end
              else DeletaImovel(cdsImovel.FieldByName('IDIMOVEL').AsString);
              cdsImovel.Next;
            end;

         CommitTransacao;
      except
         RollBackTransacao;
         Abort;
      end;
   end else
   begin
      try
         StartTransacao;
         bDeletando:= True;
         qry.ApplyUpdates;
         CommitTransacao;
      except
         RollBackTransacao;
         Abort;
      end;
   end;

   inherited;

   RecalcularSaldo;

   if bLimpar then
     LimpaCamposMaster;
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeCadastroInsert(
  Sender: TObject);
begin
  FazQuery(qry,CtrlGestInvestImovel.ListVoto('-1'));
  FazQuery(qryImoveisXVoto, CtrlGestInvestImovel.ListImovelVoto('-1'));
  FazQuery(qryDet,CtrlGestInvestImovel.ListDocGrid('-1'));
  iIdVotoGestaoImovel := CtrlGestInvestImovel.GetProxCod('VOTOGESTAOIMOVEL', 'IDVOTOGESTAOIMOVEL');
  iIdDocumentoxvoto   := CtrlGestInvestImovel.GetProxCod('DOCUMENTOXVOTO', 'IDDOCUMENTOXVOTO');
  LimpaCamposMaster;
  inherited;

  qry.fieldbyname('IDVOTOGESTAOIMOVEL').AsInteger := iIdVotoGestaoImovel;
end;

procedure TfrmCadGestInvestImovelMestreMT.bbtnConfirmarClick(
  Sender: TObject);
begin
  inherited;
  ConfirmacaoTransacao;
end;

procedure TfrmCadGestInvestImovelMestreMT.bbtnOkDetClick(Sender: TObject);
begin
  bDeletando:= False;
  dVlrPago  := edtValorPago.value;

  LimpaGrid;

  inherited;

  FazerVoltarDet;
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeCadastroEdit(Sender: TObject);
begin
  iIdDocumentoxvoto:= CtrlGestInvestImovel.GetProxCod('DOCUMENTOXVOTO', 'IDDOCUMENTOXVOTO');
  inherited;
end;

procedure TfrmCadGestInvestImovelMestreMT.CarregaLvMestre;
var
  ItemI, ItemU: TListItem;
begin
  lstImovelMestre.items.clear;
  while not qryAux.EOF do
    begin
        ItemI := lstImovelMestre.Items.Add;
        ItemI.Caption := qryAux.fieldbyname('IMONOME').AsString;
        ItemI.SubItems.Add(qryAux.fieldbyname('IDIMOVEL').AsString);
        ItemI.SubItems.Add(qryAux.fieldbyname('IMONOME').AsString);
        qryAux.Next;
    end;
end;

procedure TfrmCadGestInvestImovelMestreMT.CarregaLvUnidade;
var
  ItemU: TListItem;
begin
    bAtualizaCds:= False;

    lstUnidades.items.clear;
    while not qryAux.EOF do
      begin
        ItemU := lstUnidades.Items.Add;
        ItemU.Caption := qryAux.FieldByName('IMONOME').AsString;
        ItemU.SubItems.Add(qryAux.fieldbyname('IDIMOVEL').AsString);
        qryAux.Next;
      end;
    bAtualizaCds:= True;

    //Atualiza a barra vertical do scroll
    if (lstUnidades.Items.Count > 6) then
        lstUnidades.Height := lstUnidades.Items.Count * 18
    else lstUnidades.Height:= 129;
    ScbxUnidade.VertScrollBar.Position:= 0;
end;

procedure TfrmCadGestInvestImovelMestreMT.ChecaUnidadesMarcadas(iTpBusca: Integer);
var
  i: Integer;
  bGuardar: boolean;
begin
   try
      Screen.Cursor:= crSQLWait;
      case iTpBusca of
        1: begin //Inclui todos os dados de acordo com banco de dados
            for i := 0 to lstUnidades.Items.Count -1 do
              begin
                if qryAux.Locate('IDIMOVEL',lstUnidades.items[i].subitems[0],[]) then
                   lstUnidades.Items.Item[i].Checked := True
                else lstUnidades.Items.Item[i].Checked := false;

                if not(cdsImovel.Locate('IDIMOVEL',lstUnidades.items[i].subitems[0],[])) then
                    cdsImovel.insert
                else cdsImovel.edit;

                cdsImovel.FieldByName('IDIMOVEL').AsString    := lstUnidades.items[i].subitems[0];
                cdsImovel.FieldByName('FLGMARCADO').AsBoolean := lstUnidades.Items.Item[i].Checked;
                cdsImovel.post;
              end;
           end;
         2: begin //Atualiza lista unidades em memória
              for i := 0 to lstUnidades.Items.Count -1 do
                begin
                  if cdsImovel.Locate('IDIMOVEL',lstUnidades.items[i].subitems[0],[]) then
                     lstUnidades.Items.Item[i].Checked := cdsImovel.FieldByName('FLGMARCADO').AsBoolean;
                end;
            end;
         3: begin //Inclui todos os dados do novo imóvel sem limpar anteriores
               while not qryAux.EOF do
                begin
                    if not(cdsImovel.Locate('IDIMOVEL', qryAux.FieldByName('IDIMOVEL').AsString,[])) then
                       cdsImovel.insert
                    else cdsImovel.edit;

                    cdsImovel.FieldByName('IDIMOVEL').AsString:=  qryAux.FieldByName('IDIMOVEL').AsString;
                    cdsImovel.FieldByName('FLGMARCADO').AsBoolean:= False;
                    cdsImovel.post;
                    qryAux.Next;
                end;
            end;
         4: begin //Grava marcacao de acordo com a lista da tela
              for i := 0 to lstUnidades.Items.Count -1 do
                begin
                  if cdsImovel.Locate('IDIMOVEL',lstUnidades.items[i].subitems[0],[]) then
                    begin
                       cdsImovel.edit;
                       cdsImovel.fieldbyname('FLGMARCADO').asBoolean := lstUnidades.Items.Item[i].Checked;
                       cdsImovel.post;
                    end;
                end;
            end;
         5: begin //Inclui o novo Imovel Mestre
               if not(cdsIMP.state = dsInsert) then
                  cdsIMP.insert;

               cdsIMP.FieldByName('IDIMOVEL').AsInteger := iIdImovelMestre;
               cdsIMP.post;
            end;
      end;//Case
   finally
     Screen.Cursor:= crDefault;
   end;
end;

procedure TfrmCadGestInvestImovelMestreMT.bbtnCancelarClick(
  Sender: TObject);
begin
  if (qry.state in[dsInsert]) then
    LimpaCamposMaster;
    
  inherited;

  ConfirmacaoTransacao;
end;

procedure TfrmCadGestInvestImovelMestreMT.bbtnCancelarDetClick(
  Sender: TObject);
begin
  CancelarAlterarDetalhe;
  ExluiItemCancelado;
  LimpaGrid;

  inherited;

  RecalcularSaldo;
end;

procedure TfrmCadGestInvestImovelMestreMT.bbtnVoltarDetClick(
  Sender: TObject);
begin
  CancelarAlterarDetalhe;
  ExluiItemCancelado;
  LimpaGrid;
  
  inherited;
  RecalcularSaldo;
end;

procedure TfrmCadGestInvestImovelMestreMT.LimpaGrid;
begin
  //sem esta função cada vez que o sistema inserir dados, ele insere uma linha em branco
  iChaveDS:= qryDet.FieldByName('IDDOCUMENTOXVOTO').AsInteger;
  Status := qryDet.State;
  qryDet.first;
  while not(qryDet.Eof) do
   begin
     if (qryDet.fields[0].asString = EmptyStr)and
        (qryDet.fields[1].asString = EmptyStr)and
        (qryDet.fields[2].asString = EmptyStr)then
         qryDet.delete;
     qryDet.next;
   end;
  qryDet.Locate('IDDOCUMENTOXVOTO',IntToStr(iChaveDS),[]);
  if (Status = dsEdit) then
     qryDet.Edit;
end;

procedure TfrmCadGestInvestImovelMestreMT.ExluiItemCancelado;
begin
 if not(qryDet.state = dsEdit) then
   begin
      //só exclui se tiver inserido no btnBuscaDoc
      if (iQtdeLin <> qryDet.RecordCount) then
         begin
            iIdDocumentoxvoto:= iIdDocumentoxvoto -1;
            qryDet.first;
            while not(qryDet.Eof) do
             begin
               if (qryDet.FieldByName('IDDOCUMENTOXVOTO').asInteger = iIdDocumentoxvoto) then
                  qryDet.delete;
               qryDet.next;
             end;
         end;
   end;
end;

procedure TfrmCadGestInvestImovelMestreMT.sbtnAltDetClick(Sender: TObject);
begin
   aDetalhe[1]:= qryDet.FieldByName('DATAEMISSAO').AsString;
   aDetalhe[2]:= qryDet.FieldByName('NODOCUMENTO').AsString;
   aDetalhe[3]:= qryDet.FieldByName('NUMAPGR').AsString;
   aDetalhe[4]:= qryDet.FieldByName('VALOR').AsString;
   aDetalhe[5]:= qryDet.FieldByName('STATUS').AsString;
   aDetalhe[6]:= qryDet.FieldByName('SALDO').AsString;
   aDetalhe[7]:= qryDet.FieldByName('IDDOCUMENTOXVOTO').AsString;
   aDetalhe[8]:= qryDet.FieldByName('IDVOTOGESTAOIMOVEL').AsString;
   aDetalhe[9]:= qryDet.FieldByName('CODDOCUMENTO').AsString;
   bDeletando:= False;
   inherited;
end;

Function TfrmCadGestInvestImovelMestreMT.CancelarAlterarDetalhe: boolean;
var
  i: Integer;
begin
  if (qryDet.state in[dsEdit]) then
    begin
      qryDet.FieldByName('DATAEMISSAO').asString        :=  aDetalhe[1];
      qryDet.FieldByName('NODOCUMENTO').asString        :=  aDetalhe[2];
      qryDet.FieldByName('NUMAPGR').asString            :=  aDetalhe[3];
      qryDet.FieldByName('VALOR').asString              :=  aDetalhe[4];
      qryDet.FieldByName('STATUS').asString             :=  aDetalhe[5];
      qryDet.FieldByName('SALDO').asString              :=  aDetalhe[6];
      qryDet.FieldByName('IDDOCUMENTOXVOTO').AsString   :=  aDetalhe[7];
      qryDet.FieldByName('IDVOTOGESTAOIMOVEL').AsString :=  aDetalhe[8];
      qryDet.FieldByName('CODDOCUMENTO').AsString       :=  aDetalhe[9];
      for i:= 1 to 9 do
        aDetalhe[i]:= EmptyStr;
      result:= true;
    end
  else result:= false;
end;

procedure TfrmCadGestInvestImovelMestreMT.sbtnExcluiDetClick(
  Sender: TObject);
begin
  bDeletando:= True;
  inherited;
end;

procedure TfrmCadGestInvestImovelMestreMT.sbtnInsDetClick(Sender: TObject);
begin
  bDeletando:= False;
  iQtdeLin := qryDet.RecordCount;
  inherited;
end;

procedure TfrmCadGestInvestImovelMestreMT.edtValorPagoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  //somente leitura não funciona neste componente
  Key:= #0;
end;

procedure TfrmCadGestInvestImovelMestreMT.PovoaCds;
var i: Integer;
begin
  for i := 0 to lstUnidades.Items.Count -1 do
    begin
      if not cdsImovel.Locate('IDIMOVEL',lstUnidades.items[i].subitems[0],[]) then
        begin
          cdsImovel.insert;
          cdsImovel.fieldbyname('IDIMOVEL').asString:= lstUnidades.items[i].subitems[0];
          cdsImovel.fieldbyname('FLGMARCADO').AsBoolean:=  lstUnidades.Items.Item[i].Checked;
          cdsImovel.post;
        end;
    end;
end;

procedure TfrmCadGestInvestImovelMestreMT.lstUnidadesChange(
  Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  inherited;
  if (bAtualizaCds) then
    begin
       if (cdsImovel.Locate('IDIMOVEL',Item.subitems[0],[])) then
        begin
           cdsImovel.edit;
           cdsImovel.fieldbyname('FLGMARCADO').AsBoolean :=  Item.Checked;
           cdsImovel.post;
        end
    end;
end;

procedure TfrmCadGestInvestImovelMestreMT.ConfirmacaoTransacao;
begin
  RecalcularSaldo;
  cdsImovel.EmptyDataSet;
  cdsIMP.EmptyDataSet;
  CarregaImoveis(IntToStr(iIdVotoGestaoImovel));
  lstUnidades.Enabled  := False;
end;

procedure TfrmCadGestInvestImovelMestreMT.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  edtVoto.ReadOnly               := not(qry.State in[dsInsert,dsEdit]);
  edtResAta.ReadOnly             := not(qry.State in[dsInsert,dsEdit]);
  edtImovelMestre.ReadOnly       := not(qry.State in[dsInsert,dsEdit]);
  edtFornecedor.ReadOnly         := not(qry.State in[dsInsert,dsEdit]);
  dbcbbTIPO.ReadOnly             := not(qry.State in[dsInsert,dsEdit]);
  edtValor.ReadOnly              := not(qry.State in[dsInsert,dsEdit]);
  dbmmoDescricao.ReadOnly        := not(qry.State in[dsInsert,dsEdit]);
  btnBuscaFornecedor.Enabled     := (qry.State in[dsInsert,dsEdit]);
  btnLimpaFornecedor.Enabled     := (qry.State in[dsInsert,dsEdit]);
  btnBuscaImovelMestre.Enabled   := (qry.State in[dsInsert,dsEdit]);
  btnLimpaImovelMestre.Enabled   := (qry.State in[dsInsert,dsEdit]);
  btnIncluirImovelMestre.Enabled := (qry.State in[dsInsert,dsEdit]);
  pnlMestre.Enabled              := True;
end;

procedure TfrmCadGestInvestImovelMestreMT.AtivaUnidade;
begin
  if (qry.State in [dsInsert,dsEdit])then
    lstUnidades.Enabled:= True;
end;

end.
