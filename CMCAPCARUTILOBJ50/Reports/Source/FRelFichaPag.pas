{
 Atualizado por:  André Tavares - pendência 17315 - 30/08/2004 - criado o checkBox
                  para filtrar os ususários desabilitados.
}
unit FRelFichaPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, CMProcuraSubTipo, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, 
  Wwdatsrc, fcTreeView, wwdblook, FOkCancelar, CMDBLookupCombo, MontaSelect,
  TREdit, ImgList, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, TB97,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra,
  fParamReports_Padrao, CmParamReport, uCtrlRelatoriosCAPCAR;

type
  TFrmRelFichaPag = class(TfrmParamReports_Padrao)
    CkbBaixa: TCheckBox;
    PnlBotoes: TPanel;
    SbAdTodos: TSpeedButton;
    SbAdInverte: TSpeedButton;
    DsDocs: TwwDataSource;
    BitBtn1: TBitBtn;
    TreeDocs: TfcTreeView;
    ImgDocs: TImageList;
    CmbUsuario: TCMDBLookupCombo;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    DtIniFin: TCMDateTimePicker;
    GpFaixa: TGroupBox;
    Label1: TLabel;
    DtIni: TCMDateTimePicker;
    DtFin: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DtProgIni: TCMDateTimePicker;
    DtProgFin: TCMDateTimePicker;
    Label4: TLabel;
    CmbSisOrigem: TCMDBLookupCombo;
    CkbNaoEmite: TCheckBox;
    Label5: TLabel;
    EdtAutentica: TEdit;
    MsLotes: TMontaSelect;
    EdtNumLote: TRealEdit;
    CkbLotes: TCheckBox;
    BtnProcuraLotes: TSpeedButton;
    Label6: TLabel;
    Bevel1: TBevel;
    CkbNaoIntegra: TCheckBox;
    ckContabilizacao: TCheckBox;
    SqlDocs: TCMSqlParams;
    CdsDocs: TCMClientDataSet;
    SqlUsuario: TCMSqlParams;
    CdsUsuario: TCMClientDataSet;
    SqlRateioParc: TCMSqlParams;
    CdsRateioParc: TCMClientDataSet;
    SqlModulos: TCMSqlParams;
    CdsModulos: TCMClientDataSet;
    SqlAp: TCMSqlParams;
    CdsAp: TCMClientDataSet;
    Bevel2: TBevel;
    chkUsuDesab: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CkbLotesClick(Sender: TObject);
    procedure BtnProcuraLotesClick(Sender: TObject);
    procedure chkUsuDesabClick(Sender: TObject);
  private
    { Private declarations }
    CtrlRelatoriosCAPCAR : TCtrlRelatoriosCAPCAR;
    procedure Montaarvore;
  public
    { Public declarations }
  end;

var
  FrmRelFichaPag: TFrmRelFichaPag;

implementation

{$R *.DFM}

uses uSistema, uFuncaoGeral, DBaseDados;

procedure TFrmRelFichaPag.BitBtn1Click(Sender: TObject);
var
  sSql: string;
begin
  inherited;
  if CdsDocs.Active then
    CdsDocs.Close;
  if not CkbLotes.Checked then
    sSql := 'SELECT   d.dataprogramada,  ' +
      ' L.DATALANCTO, P.RAZAOSOCIAL, P.IDPESSOA, D.CODDOCUMENTO, ' +
      ' D.NODOCUMENTO, D.COMPLDOCUMENTO,  L.VALOR, D.STATUS, (0) AS NUMLOTE, D.NUMSLIP ' +
      'FROM ' +
      ' PESSOA P, DOCUMENTO D, LANCTODOCUM L ' +
      'WHERE' +
      ' (D.RECPAG = ''' + ParamIntegra.RecPag + ''') AND ' +
      ' (D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND '
  else
    sSql := 'SELECT   d.dataprogramada,  ' +
      ' L.DATALANCTO, P.RAZAOSOCIAL, P.IDPESSOA, D.CODDOCUMENTO, ' +
      ' D.NODOCUMENTO, D.COMPLDOCUMENTO,  LX.VALOR, D.STATUS, LX.NUMLOTE, D.NUMSLIP ' +
      'FROM ' +
      ' PESSOA P, DOCUMENTO D, LANCTODOCUM L, LOTEXDOCUM LX, LOTEPAGTO LP ' +
      'WHERE' +
      ' (D.RECPAG = ''' + ParamIntegra.RecPag + ''') AND ' +
      ' (D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND ';
  sSql := sSql + ' d.CODTIPDOC in ' +
    ' (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag +
    ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
    ParamIntegra.recpag + #39 + ' and b.idusuario=' +
    inttostr(sistema.IdUsuario) + ') ' +
    ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag +
    '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' + inttostr(sistema.idusuario) + ')) and ';
  if (DtIni.Text <> '') and (DtFin.Text <> '') then
    sSql := sSql + ' (L.DATALANCTO BETWEEN TO_DATE(''' +
      DtIni.Text + ''',''DD/MM/YYYY'') AND TO_DATE(''' + DtFin.Text + ''',''DD/MM/YYYY'')) AND ';
  if (DtProgIni.Text <> '') and (DtProgFin.Text <> '') then
    sSql := sSql + ' (D.DATAPROGRAMADA BETWEEN TO_DATE(''' +
      DtProgIni.Text + ''',''DD/MM/YYYY'') AND TO_DATE(''' + DtProgFin.Text + ''',''DD/MM/YYYY'')) AND ';
  if CkbNaoEmite.Checked then
    sSql := sSql + ' (D.NUMSLIP IS NULL) AND ';
  if CkbNaoIntegra.Checked then
    sSql := sSql + ' (L.PLNCODIGO IS NULL) AND ';
  if CkbBaixa.Checked then
    sSql := sSql + ' (D.STATUS = ''2'') AND ';
  if CmbSisOrigem.Text <> '' then
    sSql := sSql + ' (D.IDMODULO = ' + CmbSisOrigem.LookupValue + ') AND ';
  if CmbUsuario.Text <> '' then
    sSql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + CmbUsuario.LookupValue + ') AND';
  if (DtIniFin.Text <> '') then
    sSql := sSql + ' (TO_CHAR(D.TRGDTINCLUSAO,''DD/MM/YYYY'') = ''' + DtIniFin.Text + ''')  AND ';
  if (EdtNumLote.Text <> '0') and CkbLotes.Checked then
    sSql := sSql + ' (LP.NUMLOTE = ' + EdtNumLote.Text + ') AND';
  if not CkbLotes.Checked then
    sSql := sSql + ' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
      ' (D.OPERACAO = L.OPERACAO) AND ' +
      ' (D.IDFORCLI = P.IDPESSOA) ' +
      'ORDER BY ' +
      ' d.dataprogramada, P.RAZAOSOCIAL, P.IDPESSOA'
  else
    sSql := sSql + ' (D.CODDOCUMENTO = LX.CODDOCUMENTO) AND ' +
      ' (LX.NUMLOTE = LP.NUMLOTE) AND ' +
      ' ((LP.FLAGCANCEL IS NULL) OR (LP.FLAGCANCEL <> ''C'')) AND ' +
      ' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
      ' (D.OPERACAO = L.OPERACAO) AND ' +
      ' (D.IDFORCLI = P.IDPESSOA) ' +
      'ORDER BY ' +
      ' d.dataprogramada,  LX.NUMLOTE,  P.RAZAOSOCIAL, P.IDPESSOA';
  SqlDocs.Sql.Text := sSql;
  SqlDocs.Open;
  Montaarvore;
end;

procedure TFrmRelFichaPag.Montaarvore;
var
  NodeLote, NodeData, NodePessoa, NodeDoc: TfcTreeNode;
  OldLote, sOldData, sOldPessoa: string;
begin
  sOldData := '';
  sOldPessoa := '';
  OldLote := '';

  NodeData := nil;
  NodePessoa := nil;
  NodeLote := nil;

  TreeDocs.Items.Clear;

  if CkbLotes.Checked then
    while not CdsDocs.Eof do
    begin
      if OldLote <> CdsDocs.FieldByName('NUMLOTE').AsString then
      begin
        NodeLote := TreeDocs.Items.Add(nil, CdsDocs.FieldByName('NUMLOTE').AsString);
        NodeLote.ImageIndex := 4;
        NodeLote.SelectedIndex := 4;
        NodeLote.CheckboxType := tvctRadioGroup;
        NodeLote.StringData := CdsDocs.FieldByName('CODDOCUMENTO').AsString;
        NodeLote.Checked := (TreeDocs.Items.Count = 1);
        sOldData := '';
      end;

      if sOldData <> CdsDocs.FieldByName('DataProgramada').AsString then
      begin
        NodeData := TreeDocs.Items.AddChild(NodeLote, CdsDocs.FieldByName('DATAPROGRAMADA').AsString);
        NodeData.ImageIndex := 0;
        NodeData.SelectedIndex := 0;
        sOldPessoa := '';
      end;

      if sOldPessoa <> CdsDocs.FieldByName('IDPESSOA').AsString then
      begin
        NodePessoa := TreeDocs.Items.AddChild(NodeData, CdsDocs.FieldByName('RAZAOSOCIAL').AsString);
        NodePessoa.ImageIndex := 1;
        NodePessoa.SelectedIndex := 1;
      end;

      NodeDoc := TreeDocs.Items.AddChild(NodePessoa, Trim(FloatToStrF(CdsDocs.FieldByName('NODOCUMENTO').AsFloat, ffnumber, 20, 0)) +
        Funcaogeral.Decode(CdsDocs.FieldByName('COMPLDOCUMENTO').AsString, '', '', '/' + CdsDocs.FieldByName('COMPLDOCUMENTO').AsString) +
        ' - Valor: ' +
        Trim(FloatToStrF(CdsDocs.FieldByName('VALOR').AsFloat, ffnumber, 20, 2)));

      if CdsDocs.FieldByName('STATUS').AsString = '2' then
      begin
        NodeDoc.ImageIndex := 2;
        NodeDoc.SelectedIndex := 2;
      end
      else
      begin
        NodeDoc.ImageIndex := 3;
        NodeDoc.SelectedIndex := 3;
      end;

      sOldData := CdsDocs.FieldByName('DATAPROGRAMADA').AsString;
      sOldPessoa := CdsDocs.FieldByName('IDPESSOA').AsString;
      CdsDocs.Next;
    end
  else
    while not CdsDocs.Eof do
    begin
      if sOldData <> CdsDocs.FieldByName('DATAPROGRAMADA').AsString then
      begin
        NodeData := TreeDocs.Items.Add(nil, CdsDocs.FieldByName('DATAPROGRAMADA').AsString);
        NodeData.ImageIndex := 0;
        NodeData.SelectedIndex := 0;
        sOldPessoa := '';
      end;

      if sOldPessoa <> CdsDocs.FieldByName('IDPESSOA').AsString then
      begin
        NodePessoa := TreeDocs.Items.AddChild(NodeData, CdsDocs.FieldByName('RAZAOSOCIAL').AsString);
        NodePessoa.ImageIndex := 1;
        NodePessoa.SelectedIndex := 1;
      end;

      NodeDoc := TreeDocs.Items.AddChild(NodePessoa, Trim(FloatToStrF(CdsDocs.FieldByName('NODOCUMENTO').AsFloat, ffnumber, 20, 0)) +
        Funcaogeral.Decode(CdsDocs.FieldByName('COMPLDOCUMENTO').AsString, '', '', '/' + CdsDocs.FieldByName('COMPLDOCUMENTO').AsString) +
        ' - Valor: ' +
        Trim(FloatToStrF(CdsDocs.FieldByName('VALOR').AsFloat, ffnumber, 20, 2)));
      NodeDoc.CheckboxType := tvctCheckbox;
      NodeDoc.StringData := CdsDocs.FieldByName('CODDOCUMENTO').AsString;

      if CdsDocs.FieldByName('STATUS').AsString = '2' then
      begin
        NodeDoc.ImageIndex := 2;
        NodeDoc.SelectedIndex := 2;
      end
      else
      begin
        NodeDoc.ImageIndex := 3;
        NodeDoc.SelectedIndex := 3;
      end;

      sOldData := CdsDocs.FieldByName('DATAPROGRAMADA').AsString;
      sOldPessoa := CdsDocs.FieldByName('IDPESSOA').AsString;
      CdsDocs.Next;
    end;
end;

procedure TFrmRelFichaPag.SbAdTodosClick(Sender: TObject);
var
  X: Integer;
begin
  inherited;
  for X := 0 to TreeDocs.Items.Count - 1 do
    if TreeDocs.Items[x].ImageIndex > 1 then
      TreeDocs.Items[x].Checked := True;
end;

procedure TFrmRelFichaPag.SbAdInverteClick(Sender: TObject);
var
  X: Integer;
begin
  inherited;
  for X := 0 to TreeDocs.Items.Count - 1 do
    if TreeDocs.Items[x].ImageIndex > 1 then
      TreeDocs.Items[x].Checked := not TreeDocs.Items[x].Checked;
end;

procedure TFrmRelFichaPag.bbtnConfirmarClick(Sender: TObject);
var
  X: Integer;
  sDocs, sNumLote, sNumSlip: string;
begin
  inherited;
  sNumLote := '';
  sNumSlip := '';
  if CkbLotes.Checked then
  begin
    for X := 0 to TreeDocs.Items.Count - 1 do
      if (TreeDocs.Items[x].ImageIndex = 4) and
        (TreeDocs.Items[x].Checked) then
      begin
        sNumLote := ' Lote Nº ' + TreeDocs.Items[x].Text;
        if CdsDocs.Locate('NUMLOTE', TreeDocs.Items[x].Text, []) then
        begin
          sNumSlip := Trim(CdsDocs.FieldByName('NUMSLIP').AsString);
          while (TreeDocs.Items[x].Text = CdsDocs.FieldByName('NUMLOTE').AsString) and (not CdsDocs.Eof) do
          begin
            sDocs := sDocs + ',' + TreeDocs.Items[x].StringData;
            CdsDocs.Next;
          end;
        end;
      end;
  end
  else
    for X := 0 to TreeDocs.Items.Count - 1 do
      if (TreeDocs.Items[x].ImageIndex > 1) and
        (TreeDocs.Items[x].ImageIndex < 5) and
        (TreeDocs.Items[x].Checked) then
      begin
        sDocs := sDocs + ',' + TreeDocs.Items[x].StringData;
        sNumSlip := Trim(CdsDocs.FieldByName('NUMSLIP').AsString);
      end;
  SDocs := Copy(sDocs, 2, Length(sDocs));
  if sDocs <> '' then
  begin
    if sNumSlip = '' then
    begin
      if not CtrlRelatoriosCAPCAR.SetNumSlip(sDocs) then
      //
      ;
    end;
  end;
  Cmp_Padrao.ParamValues[0].AsString := SDocs;
  Cmp_Padrao.ParamValues[1].AsBoolean := ckContabilizacao.Checked;
  Cmp_Padrao.ParamValues[2].AsString := sNumLote;
  Cmp_Padrao.ParamValues[3].AsString := EdtAutentica.Text;
end;

procedure TFrmRelFichaPag.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
  CtrlRelatoriosCAPCAR.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  SqlUsuario.Open;

// início - André Tavares - pendência 17315 - 30/08/2004
  CdsUsuario.Filtered := false;
  CdsUsuario.Filter := ' DESATIVADO = ''N'' ';
  CdsUsuario.Filtered := true;
// fim - André Tavares - pendência 17315 - 30/08/2004


  if ParamIntegra.RecPag = 'R' then
  begin
    Caption := 'Ficha Financeira para Recebimento';
  end;
  SqlModulos.Open;
end;

procedure TFrmRelFichaPag.CkbLotesClick(Sender: TObject);
begin
  inherited;
  TreeDocs.Items.Clear;
  PnlBotoes.Enabled := not CkbLotes.Checked;
end;

procedure TFrmRelFichaPag.BtnProcuraLotesClick(Sender: TObject);
begin
  inherited;
  MsLotes.Executar;
  if MsLotes.RetornouValor then
    EdtNumLote.Text := MsLotes.ValoresChave[0]
  else
    EdtNumLote.Text := '0';
end;

// início - André Tavares - pendência 17315 - 30/08/2004
procedure TFrmRelFichaPag.chkUsuDesabClick(Sender: TObject);
begin
  inherited;
  CdsUsuario.Filtered := not chkUsuDesab.Checked
end;
// fim - André Tavares - pendência 17315 - 30/08/2004

end.

