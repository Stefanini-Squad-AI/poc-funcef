// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Data        : 22/04/2008
// Pendencia   : 27590
// Alteração   : Criação de um novo item de tipo de beneficio (Portabilidade)
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 11/04/2007
// Pendencia   : 21960
// Alteração   : Criação de um novo item de destino de pagamento
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 13.08.2004
// Alteração   : Ordenar qryevento pelo nome
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 03.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO na qryBenefEvento
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadBenefEventoCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, wwdbedit, wwdblook,
  TB97Ctls, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, Wwdbspin, IvDictio,
  IvMulti, IvEMulti, Wwdotdot, Wwdbcomb, CmEventosCadastro, ImgList;

type
  TfrmCadBenefEventoCS = class(TfrmCadastroCS)
    qryAux: TwwQuery;
    qryEvento: TwwQuery;
    qryTpPgto: TwwQuery;
    Label1: TLabel;
    lbBeneficio: TLabel;
    Label3: TLabel;
    dblkcmbPgtoBenef: TwwDBLookupCombo;
    dbedNomeBenef: TwwDBEdit;
    dbrgrpDestBenef: TDBRadioGroup;
    dbedIDBeneficio: TDBEdit;
    qryBenefEvento: TwwQuery;
    dsBenefEvento: TwwDataSource;
    pnlLeft: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    dblkcmbEventoGera: TwwDBLookupCombo;
    dbgrdBenefEventos: TwwDBGrid;
    Label4: TLabel;
    grpFlags: TGroupBox;
    dbchkBenefResgate: TDBCheckBox;
    dbchkBenefObrigatorio: TDBCheckBox;
    dbchkBenefTemp: TDBCheckBox;
    dbchkPeculio: TDBCheckBox;
    grpOutros: TGroupBox;
    Label5: TLabel;
    spedNumOrdem: TwwDBSpinEdit;
    Label7: TLabel;
    dbedPrazoProv: TwwDBEdit;
    Label8: TLabel;
    dbcbTipoBen: TwwDBComboBox;
    Label9: TLabel;
    dbedRub: TwwDBEdit;
    Label10: TLabel;
    dbrgrpDtPrevisao: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    dbedCodBenefSPC: TwwDBEdit;
    Label11: TLabel;
    qryRegra: TwwQuery;
    cmbregraspc: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure dblkcmbEventoGeraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbrgrpDestBenefClick(Sender: TObject);
    procedure dbchkBenefTempClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBenefEventoCS: TfrmCadBenefEventoCS;

implementation

uses UAdmPrev, UDataBase, USistema, UMensErro;

{$R *.DFM}



procedure TfrmCadBenefEventoCS.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     qry.Close;
     qry.ParamByName('IDBENEFICIO').Value := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;

     qryBenefEvento.Close;
     qryBenefEvento.ParamByName('IdEventoGerador').AsInteger := qryEvento.FieldbyName('IdEventoGerador').AsInteger;
     qryBenefEvento.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
     qryBenefEvento.Open;
  end;
end;

procedure TfrmCadBenefEventoCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled:=True;
  dblkcmbEventoGera.SetFocus;
  qryBenefEvento.Close;
  qryBenefEvento.ParamByName('IdEventoGerador').AsInteger := -1;
  qryBenefEvento.ParamByName('IDFUNDACAO').AsInteger := -1;
  qryBenefEvento.Open;
  dbcbTipoBen.Text           := '';
  dbrgrpDtPrevisao.Visible   := False;
  dbrgrpDtPrevisao.ItemIndex := 1;

end;

procedure TfrmCadBenefEventoCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled:=True;
  dbedIDBeneficio.SetFocus;
end;


procedure TfrmCadBenefEventoCS.FormCreate(Sender: TObject);
begin
  inherited;

  qryEvento.Close;
  qryEvento.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryEvento.Open;
  qryBenefEvento.Close;

  qry.Close;
  qry.ParamByName('IDBENEFICIO').Value := 0;
  qry.Open;
end;

procedure TfrmCadBenefEventoCS.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.DataSet.State in [dsEdit,dsInsert]
  then dbedCodBenefSPC.SetFocus;
  dblkcmbEventoGera.Enabled := (ds.Dataset.state in [dsEdit, dsInsert]);
end;

procedure TfrmCadBenefEventoCS.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dbchkBenefObrigatorio.Checked := False;
  dbchkBenefResgate.Checked     := False;
  dbchkPeculio.Visible          := True;
  dbchkBenefTemp.Checked        := False;

  dbchkPeculio.Checked          := False;
  qry.FieldByName('FLGBENEFOBRIGATO').AsInteger := 0;
  qry.FieldByName('FLGRESGATE').AsInteger       := 0;
  qry.FieldByName('FLGBENEFTEMP').AsInteger     := 0;
  qry.FieldByName('FLGBENEFPROV').AsInteger     := 0;
  qry.FieldByName('FLGPECULIO').AsInteger       := 0;
  qry.FieldbyName('NumOrdemEvento').AsInteger   := 1;
  spedNumOrdem.Value        := 1;
  dbrgrpDestBenef.ItemIndex := 1;
  dbcbTipoBen.ItemIndex := 0;
end;

procedure TfrmCadBenefEventoCS.bbtnConfirmarClick(Sender: TObject);
begin
  if (dbedNomeBenef.Text = '')     or (dblkcmbPgtoBenef.Text = '') or
     (dblkcmbEventoGera.Text = '') or (dbrgrpDestBenef.ItemIndex = -1)
  then begin
    showmessage('Existem campos em branco !');
    Exit;
  end;
  
  if (dbedRub.Text = '') then
  begin
    MsgDlg('O campo Descrição de RUB nao pode ser branco.','Erro',mtError,[mbOk,mbHelp],0);
    qry.FieldByName('DESCRUB').AsString := qry.FieldByName('NOME').AsString;
    dbedRub.SetFocus;
    Abort;
  end;

  inherited;
  if Trim(dblkcmbEventoGera.Text) <> ''
  then begin
     qryBenefEvento.Close;
     qryBenefEvento.ParamByName('IdEventoGerador').AsInteger := qryEvento.FieldbyName('IdEventoGerador').AsInteger;
     qryBenefEvento.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
     qryBenefEvento.Open;
  end;
end;

procedure TfrmCadBenefEventoCS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dbchkPeculio.Visible          := (dbrgrpDestBenef.ItemIndex = 0);
  dbrgrpDtPrevisao.Visible      := (dbchkBenefTemp.Checked);
end;

procedure TfrmCadBenefEventoCS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qry.State = dsInsert
  then begin
     try
       qry.FieldByName('IDBENEFICIO').AsInteger := LeUltRegistro(qryAux,'BENEFICIO');
     except
       ShowMessage('Erro na geração do código');
     end;
  end;

  if dbchkBenefResgate.checked 
  then qry.FieldByName('FLGRESGATE').AsInteger := 1
  else qry.FieldByName('FLGRESGATE').AsInteger := 0;

end;

procedure TfrmCadBenefEventoCS.FormActivate(Sender: TObject);
begin
  inherited;
  qryTpPgto.Close;
  qryTpPgto.Open;
  qryEvento.Close;
  qryEvento.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryEvento.Open;

  qryRegra.Close;
  qryRegra.Open;

end;

procedure TfrmCadBenefEventoCS.dblkcmbEventoGeraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (not (qry.State in [dsInsert, dsEdit]))
      Or (Trim(dblkcmbEventoGera.LookupValue)= '') then Exit;
  qryBenefEvento.Close;
  qryBenefEvento.ParamByName('IdEventoGerador').AsInteger := qryEvento.FieldbyName('IdEventoGerador').AsInteger;
  qryBenefEvento.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryBenefEvento.Open;
end;

procedure TfrmCadBenefEventoCS.dbrgrpDestBenefClick(Sender: TObject);
begin
  inherited;

  dbchkPeculio.Visible          := (dbrgrpDestBenef.ItemIndex = 0);
end;

procedure TfrmCadBenefEventoCS.dbchkBenefTempClick(Sender: TObject);
begin
  inherited;
  dbrgrpDtPrevisao.Visible := dbchkBenefTemp.Checked;
end;

procedure TfrmCadBenefEventoCS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmCadBenefEventoCS.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add(' BENEFICIO.IDBENEFICIO IN (SELECT BP.IDBENEFICIO FROM PLANPREVPATRO PLP, PATRO P, BENEFPLANPREV BP '+ 
                         '                          WHERE   P.IDFUNDACAO = '+IntToStr(iIdFundacao)          +
                         '                          AND     PLP.IDPESSJUR = P.IDPESSOA                      '+
                         '                          AND     BP.IDPLANOPREV = PLP.IDPLANOPREV) OR            '+
                         ' NOT EXISTS (SELECT 1 FROM BENEFPLANPREV BP WHERE BP.IDBENEFICIO = BENEFICIO.IDBENEFICIO) ');

end;

end.
