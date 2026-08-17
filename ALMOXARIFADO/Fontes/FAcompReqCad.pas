unit FAcompReqCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, TEdNum,
  wwdblook, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup,
  ComCtrls, fcLabel, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmAcompReqCad = class(TfrmSairAjuda)
    qryCCust: TwwQuery;
    PgcReq: TPageControl;
    TbFiltro: TTabSheet;
    TbResult: TTabSheet;
    Label1: TLabel;
    EdNumReq: TEditNum;
    Label4: TLabel;
    dblcCCust: TwwDBLookupCombo;
    GrpData: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edDataReqIni: TCMDateTimePicker;
    EdDataNecIni: TCMDateTimePicker;
    RgStatus: TRadioGroup;
    Panel1: TPanel;
    btSelecionar: TBitBtn;
    qryAlmox: TwwQuery;
    Label5: TLabel;
    edDataAtendIni: TCMDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Label8: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    qryGrpProd: TwwQuery;
    Label9: TLabel;
    dblcDesc: TwwDBLookupCombo;
    Bevel1: TBevel;
    plnReq: TPanel;
    plnItem: TPanel;
    Splitter1: TSplitter;
    plnlbReq: TPanel;
    plnLbItem: TPanel;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    GrdReq: TwwDBGrid;
    GrdItem: TwwDBGrid;
    qryArtigo: TwwQuery;
    BtnLimpar: TBitBtn;
    qryReq: TwwQuery;
    dsReq: TwwDataSource;
    qryReqNUMREQUISICAO: TFloatField;
    qryReqORIGEM: TStringField;
    qryReqDESTINO: TStringField;
    qryReqDATAEMISSAO: TDateTimeField;
    qryReqDATANECESSIDADE: TDateTimeField;
    dsItens: TwwDataSource;
    qryItens: TwwQuery;
    Label10: TLabel;
    edDataReqFim: TCMDateTimePicker;
    Label11: TLabel;
    EdDataNecFim: TCMDateTimePicker;
    Label12: TLabel;
    edDataAtendFim: TCMDateTimePicker;
    qryReqSTATUS: TStringField;
    qryItensNUMREQUISICAO: TFloatField;
    qryItensCODARTIGO: TStringField;
    qryItensDESCRICAO: TStringField;
    qryItensCODMEDIDA: TStringField;
    qryItensQTDEPEDIDA: TFloatField;
    qryItensQTDEPENDENTE: TFloatField;
    qryItensVALORUN: TFloatField;
    qryItensSTATUS: TStringField;
    dsAtend: TwwDataSource;
    qryAtend: TwwQuery;
    qryAtendQTDEENTREGA: TFloatField;
    qryAtendCODMEDIDA: TStringField;
    qryAtendDATARECEB: TDateTimeField;
    qryAtendVALORUN: TFloatField;
    qryAtendDATAENTREGA: TDateTimeField;
    qryAtendATENDENTE: TStringField;
    qryAtendCONFDEV: TStringField;
    qryAtendSTATUS: TStringField;
    Label13: TLabel;
    qryUsu: TwwQuery;
    dblcUsu: TwwDBLookupCombo;
    qryReqNOMEUSUARIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure dsReqDataChange(Sender: TObject; Field: TField);
    procedure EdNumReqExit(Sender: TObject);
    procedure EdNumReqKeyPress(Sender: TObject; var Key: Char);
    procedure edDataReqIniExit(Sender: TObject);
    procedure edDataReqFimExit(Sender: TObject);
    procedure EdDataNecIniExit(Sender: TObject);
    procedure EdDataNecFimExit(Sender: TObject);
    procedure edDataAtendIniExit(Sender: TObject);
    procedure edDataAtendFimExit(Sender: TObject);
    procedure dblcGrpProdCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure GrdItemDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure FazConsulta;
  end;

var
  FrmAcompReqCad: TFrmAcompReqCad;

implementation

{$R *.DFM}
Uses uSistema, uMensErro,FViewAtend, FtelaAut;

procedure TFrmAcompReqCad.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrpProd.Open;
  //
  qryCCust.Close;
  qryCCust.Params[0].Value := Sistema.IdEmpresa;
  qryCCust.Open;
  //
  qryAlmox.Close;
  qryAlmox.Params[0].Value := Sistema.IdEmpresa;
  qryAlmox.Open;
  //
  qryArtigo.Open;
  //
  qryUsu.Open;
end;

Procedure TFrmAcompReqCad.FazConsulta;
Begin
   With qryReq Do
      Begin
          Close;
          Sql.Clear;
          Sql.Add(' SELECT DISTINCT                                                  ');
          Sql.Add('       RQ.NUMREQUISICAO,                                          ');
          Sql.Add('       AO.DESCALMOX AS ORIGEM,                                    ');
          Sql.Add('       DECODE(CUSTOTRANSF,''T'',AD.DESCALMOX,CC.NOME) AS DESTINO, ');
          Sql.Add('       RQ.DATAEMISSAO,                                            ');
          Sql.Add('       RQ.DATANECESSIDADE,                                        ');
          Sql.Add('       DECODE(RQ.REQATENDIDA,''F'',''PENDENTE'', DECODE(RQ.REQATENDIDA,''T'',''ANTED. TOTAL'',''ANTED. PARCIAL'') )  AS  STATUS, ');
          Sql.Add('       U.NOMEUSUARIO ');
          Sql.Add(' FROM                                                             ');
          Sql.Add('    REQMAT RQ,                                                    ');
          Sql.Add('    ALMOX AO,                                                     ');
          Sql.Add('    ALMOX AD,                                                     ');
    If (Trim(dblcDesc.Text) <> '') Then
          Sql.Add('    ITEMPEDI IP, ');

    If (Trim(dblcGrpProd.Text) <> '') Then
       Begin
          Sql.Add('    ITEMPEDI IP, ');
          Sql.Add('    PRODUTO P, ');
          Sql.Add('    ARTIGO A, ');
       End;
   If (Trim(edDataAtendIni.Text) <> '' ) or (Trim(edDataAtendFim.Text) <> '') Then
          Sql.Add('    ITEMENTR IE, ');

          Sql.Add('    CENTCUST CC,       ');
          Sql.Add('    USUARIOSISTEMA U   ');
          Sql.Add(' WHERE  (RQ.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ');
          Sql.Add('    AND (RQ.CODALMOXAORIGEM = AO.CODALMOXARIFADO)                 ');
          Sql.Add('    AND (RQ.CODALMOXADESTINO = AD.CODALMOXARIFADO(+))             ');
          Sql.Add('    AND (RQ.CODCENTROCUSTO = CC.CODCENTROCUSTO)                   ');
          Sql.Add('    AND (RQ.IDEMPRESA = CC.IDEMPRESA)                             ');
          Sql.Add('    AND (TO_NUMBER(RTRIM(SUBSTR(RQ.TRGUSERINCLUSAO,3,30))) = U.IDUSUARIO )');

//========================================================================================================================
//  Filtros
//========================================================================================================================
      Case RgStatus.ItemIndex Of
         1 : Sql.Add(' AND (RQ.REQATENDIDA =''F'' )');
         2 : Sql.Add(' AND (RQ.REQATENDIDA =''T'' )');
         3 : Sql.Add(' AND (RQ.REQATENDIDA =''P'' )');
      End;
     If Trim(EdNumReq.Text) <> '' Then
        Sql.Add('    AND (RQ.NUMREQUISICAO = '+EdNumReq.Text+')                    ');
     If Sistema.idRad <> 0 Then
        Sql.Add('    AND (RQ.IDPROCESSO = '+IntToStr(Sistema.idRad)+')                    ');
     If Trim(dblcCCust.Text) <> '' Then
        Sql.Add('    AND (RTRIM(RQ.CODCENTROCUSTO) = '+Trim(dblcCCust.LookupValue)+')           ');
     If Trim(dblcAlmox.Text) <> '' Then
        Sql.Add('    AND (RQ.CODALMOXAORIGEM = '+dblcAlmox.LookupValue+')          ');
     If (Trim(edDataReqIni.Text) <> '' )  Then
        Sql.Add('    AND (RQ.DATAEMISSAO >= TO_DATE('''+DateToStr(edDataReqIni.Date)+''',''DD/MM/YYYY'')) ');
     If (Trim(edDataReqFim.Text) <> '') Then
        Sql.Add('    AND (RQ.DATAEMISSAO <= TO_DATE('''+DateToStr(edDataReqFim.Date)+''',''DD/MM/YYYY'')) ');
     If (Trim(EdDataNecIni.Text) <> '' ) Then
        Sql.Add('    AND (RQ.DATANECESSIDADE >= TO_DATE('''+DateToStr(EdDataNecIni.Date)+''',''DD/MM/YYYY'')) ');
     If (Trim(EdDataNecFim.Text) <> '') Then
        Sql.Add('    AND (RQ.DATANECESSIDADE <= TO_DATE('''+DateToStr(EdDataNecFim.Date)+''',''DD/MM/YYYY'')) ');
     If (Trim(dblcDesc.Text) <> '') Then
       Begin
          Sql.Add('   AND (RTRIM(IP.CODARTIGO) = '''+Trim(dblcDesc.LookupValue)+''') ');
          Sql.Add('   AND (IP.NUMREQUISICAO = RQ.NUMREQUISICAO) ');
       End;
     If (Trim(dblcGrpProd.Text) <> '') Then
       Begin
          Sql.Add('   AND (IP.NUMREQUISICAO = RQ.NUMREQUISICAO) ');
          Sql.Add('   AND (RTRIM(P.CODGRUPOPROD) = '''+Trim(dblcGrpProd.LookupValue)+''') ');
          Sql.Add('   AND (P.CODPRODUTO = A.CODPRODUTO ) ');
          Sql.Add('   AND (A.CODARTIGO = IP.CODARTIGO ) ');

       End;
     If (Trim(edDataAtendIni.Text) <> '' ) Then
       Begin
          Sql.Add('   AND (IE.DATAENTREGA >= TO_DATE('''+DateToStr(edDataAtendIni.Date)+''',''DD/MM/YYYY'')) ');
          Sql.Add('   AND (IE.NUMREQUISICAO = RQ.NUMREQUISICAO) ');
       End;
     If (Trim(edDataAtendFim.Text) <> '') Then
       Begin
          Sql.Add('   AND (IE.DATAENTREGA <= TO_DATE('''+DateToStr(edDataAtendFim.Date)+''',''DD/MM/YYYY'')) ');
          Sql.Add('   AND (IE.NUMREQUISICAO = RQ.NUMREQUISICAO) ');
       end;
     If (Trim(dblcUsu.Text) <> '') Then
       Sql.Add('      AND (RQ.TRGUSERINCLUSAO = '+QuotedStr('CM'+dblcUsu.LookupValue)+' )');
          Sql.Add(' ORDER BY                                                         ');
          Sql.Add('      NUMREQUISICAO                                               ');
          Open;
      End;

End;

procedure TFrmAcompReqCad.btSelecionarClick(Sender: TObject);
begin
  inherited;
  FazConsulta;
  PgcReq.ActivePage := TbResult;
  GrdReq.SetFocus;
end;

procedure TFrmAcompReqCad.BtnLimparClick(Sender: TObject);
begin
  inherited;
  EdNumReq.Text         := '';
  RgStatus.ItemIndex    := 0;
  edDataReqIni.Text     := '';
  EdDataNecIni.Text     := '';
  edDataAtendIni.Text   := '';
  edDataReqFim.Text     := '';
  edDataNecFim.Text     := '';
  edDataAtendFim.Text   := '';
  dblcCCust.Text        := '';
  dblcAlmox.Text        := '';
  dblcGrpProd.Text      := '';
  dblcDesc.Text         := '';
  dblcUsu.Text          := '';
  //
  RgStatus.Enabled       := True;
  edDataReqIni.Enabled   := True;
  EdDataNecIni.Enabled   := True;
  edDataAtendIni.Enabled := True;
  edDataReqFim.Enabled   := True;
  edDataNecFim.Enabled   := True;
  edDataAtendFim.Enabled := True;
  dblcCCust.Enabled      := True;
  dblcAlmox.Enabled      := True;
  dblcGrpProd.Enabled    := True;
  dblcDesc.Enabled       := True;
end;

procedure TFrmAcompReqCad.dsReqDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  qryItens.DisableControls;
  qryItens.Close;
  qryItens.Params[0].Value := qryReq.FieldByName('NUMREQUISICAO').asInteger;
  qryItens.Open;
  qryItens.EnableControls;
end;

procedure TFrmAcompReqCad.EdNumReqExit(Sender: TObject);
begin
  inherited;
  if Trim(EdNumReq.Text) <> '' Then
    Begin
       RgStatus.ItemIndex    := 0;
       edDataReqIni.Text     := '';
       EdDataNecIni.Text     := '';
       edDataAtendIni.Text   := '';
       edDataReqFim.Text     := '';
       edDataNecFim.Text     := '';
       edDataAtendFim.Text   := '';
       dblcAlmox.Text        := '';
       dblcGrpProd.Text      := '';
       dblcDesc.Text         := '';
       //
       RgStatus.Enabled       := False;
       edDataReqIni.Enabled   := False;
       EdDataNecIni.Enabled   := False;
       edDataAtendIni.Enabled := False;
       edDataReqFim.Enabled   := False;
       edDataNecFim.Enabled   := False;
       edDataAtendFim.Enabled := False;
       dblcCCust.Enabled      := False;
       dblcAlmox.Enabled      := False;
       dblcGrpProd.Enabled    := False;
       dblcDesc.Enabled       := False;
    End
  Else
    Begin
       RgStatus.Enabled       := True;
       edDataReqIni.Enabled   := True;
       EdDataNecIni.Enabled   := True;
       edDataAtendIni.Enabled := True;
       edDataReqFim.Enabled   := True;
       edDataNecFim.Enabled   := True;
       edDataAtendFim.Enabled := True;
       dblcCCust.Enabled      := True;
       dblcAlmox.Enabled      := True;
       dblcGrpProd.Enabled    := True;
       dblcDesc.Enabled       := True;
    End;


end;

procedure TFrmAcompReqCad.EdNumReqKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Case key of
    '0'..'9',#8:;
  Else
    Key := #0;
  End;
end;

procedure TFrmAcompReqCad.edDataReqIniExit(Sender: TObject);
begin
  inherited;
  If (edDataReqFim.Text) <> '' Then
     Begin
         If edDataReqFim.Date < edDataReqIni.Date Then
           Begin
              MsgDlg('Data inicial não pode ser maior que a'+#13+#10+'data final.','Erro',mtError,[mbOK],0);
              edDataReqIni.SetFocus;
           End;
     End;
end;

procedure TFrmAcompReqCad.edDataReqFimExit(Sender: TObject);
begin
  inherited;
  If (edDataReqIni.Text) <> '' Then
     Begin
         If edDataReqFim.Date <  edDataReqIni.Date Then
           Begin
              MsgDlg('Data inicial não pode ser maior que a'+#13+#10+'data final.','Erro',mtError,[mbOK],0);
              edDataReqFim.SetFocus;
           End;

     End;
end;

procedure TFrmAcompReqCad.EdDataNecIniExit(Sender: TObject);
begin
  inherited;
  If (EdDataNecFim.Text) <> '' Then
     Begin
         If EdDataNecFim.Date <  EdDataNecIni.Date Then
           Begin
              MsgDlg('Data inicial não pode ser maior que a'+#13+#10+'data final.','Erro',mtError,[mbOK],0);
              EdDataNecIni.SetFocus;
           End;
     End;
end;

procedure TFrmAcompReqCad.EdDataNecFimExit(Sender: TObject);
begin
  inherited;
  If (EdDataNecIni.Text) <> '' Then
     Begin
         If EdDataNecFim.Date <  EdDataNecIni.Date Then
           Begin
              MsgDlg('Data inicial não pode ser maior que a'+#13+#10+'data final.','Erro',mtError,[mbOK],0);
              EdDataNecFim.SetFocus;
           End;
     End;
end;

procedure TFrmAcompReqCad.edDataAtendIniExit(Sender: TObject);
begin
  inherited;
  If (edDataAtendFim.Text) <> '' Then
     Begin
         If edDataAtendFim.Date <  edDataAtendIni.Date Then
           Begin
              MsgDlg('Data inicial não pode ser maior que a'+#13+#10+'data final.','Erro',mtError,[mbOK],0);
              edDataAtendIni.SetFocus;
           End;
     End;
end;

procedure TFrmAcompReqCad.edDataAtendFimExit(Sender: TObject);
begin
  inherited;
  If (edDataAtendIni.Text) <> '' Then
     Begin
         If edDataAtendFim.Date <  edDataAtendIni.Date Then
           Begin
              MsgDlg('Data inicial não pode ser maior que a'+#13+#10+'data final.','Erro',mtError,[mbOK],0);
              edDataAtendFim.SetFocus;
           End;
     End;
end;

procedure TFrmAcompReqCad.dblcGrpProdCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (Trim(dblcGrpProd.Text) <> '') Then
      dblcDesc.Text := '';
end;

procedure TFrmAcompReqCad.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (Trim(dblcDesc.Text) <> '') Then
      dblcGrpProd.Text := '';
end;

procedure TFrmAcompReqCad.GrdItemDblClick(Sender: TObject);
begin
  inherited;
  qryAtend.Close;
  qryAtend.ParamByName('pNUMREQ').asInteger   := qryReq.FieldByName('NUMREQUISICAO').asInteger;
  qryAtend.ParamByName('pCODARTIGO').asString := qryItens.FieldByName('CODARTIGO').asString;
  qryAtend.Open;
  If Not qryAtend.IsEmpty Then
    Begin
       application.CreateForm(TFrmViewAtend,FrmViewAtend);
       FrmViewAtend.plnTitulo.Caption := ' Requisição: '+qryReq.FieldByName('NUMREQUISICAO').asString+'     Artigo: '+qryitens.FieldByName('DESCRICAO').asString;
       FrmViewAtend.ShowModal;
    End
  Else
     MsgDlg('Item '+qryitens.FieldByName('DESCRICAO').asString+' não foi atendido','Informação',mtInformation,[mbOK],0);
end;

procedure TFrmAcompReqCad.FormActivate(Sender: TObject);
begin
  inherited;
  if Sistema.IdRAD <> 0 then
     btSelecionar.Click;
end;

end.
