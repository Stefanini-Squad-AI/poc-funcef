unit fDetalhes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MontaSelect, ppDB, ppDBBDE, ppBands, ppReport, ppStrtch,
  ppSubRpt, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppProd, Db,
  Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, Mask, wwdbedit,
  Grids, Wwdbigrd, Wwdbgrid, Machklb, ppEndUsr, fcClearPanel,
  fcButtonGroup, fcOutlookBar, fcOutlookList, fcButton, fcImgBtn,
  fcShapeBtn, TeeProcs, TeEngine, Chart, DBChart, ppChrtDB, FOkCancelar,
  ImgList;

type
  TfrmDetalhes = class(TfrmSairAjuda)
    MontaSelect1: TMontaSelect;
    Panel1: TPanel;
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label2: TLabel;
    dbgrDados: TwwDBGrid;
    fcOutlookBar1: TfcOutlookBar;
    fcOutlookBar1OutlookList1: TfcOutlookList;
    fcOutlookBar1fcShapeBtn1: TfcShapeBtn;
    ImageList1: TImageList;
    Label4: TLabel;
    wwDBEdit3: TwwDBEdit;
    btnConsultar: TBitBtn;
    Bevel1: TBevel;
    procedure btnConsultarClick(Sender: TObject);
    procedure fcOutlookBar1OutlookList1Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items5Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items6Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetalhes: TfrmDetalhes;

implementation

uses uMensErro, fAguarde, uSistema, dRelDetalhes, dRegra;

{$R *.DFM}

procedure TfrmDetalhes.btnConsultarClick(Sender: TObject);
var
   vId, iTipoRegra  : LongInt;
begin
  inherited;
  MontaSelect1.Executar;
  Refresh;
  frmAguarde.Mostra('Selecionando Dados ...');
  frmAguarde.Refresh;
  frmAguarde.Max := 7;
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  if MontaSelect1.RetornouValor then begin
     try
        vId := StrtoInt(MontaSelect1.ValoresChave[1]);
        iTipoRegra := StrtoInt(MontaSelect1.ValoresChave[2]);
     except
        vId := 0;
        iTipoRegra := 0;
     end;

     with dtmRelDetalhes.QryPermissao do begin
          Close;
          ParambyName('GRUPO').AsInteger := vId;
          ParambyName('TIPO').AsInteger  := iTipoRegra;
          ParambyName('USUARIO').AsInteger := Sistema.IdUsuario;
          Open;
     end;

     if dtmRelDetalhes.QryPermissao.IsEmpty then begin
        MsgDlg('Usuário ('+Sistema.NomeUsuario+') sem permissão de consulta a este tipo de regra.','Erro',mtError,[mbOK],0);
        frmAguarde.Apaga;
        Exit;
     end else begin
         if dtmRelDetalhes.QryPermissao.FieldbyName('FLGPROCURAR').AsInteger = 0 then begin
            MsgDlg('Usuário ('+Sistema.NomeUsuario+') sem permissão de consulta a este tipo de regra.','Erro',mtError,[mbOK],0);
            frmAguarde.Apaga;
            Exit;
         end;
     end;

     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.Qry do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(MontaSelect1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryCampo do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(MontaSelect1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryFormula do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(MontaSelect1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryRegra do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(MontaSelect1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryVariavel do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(MontaSelect1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryPai do begin
          Close;
          ParambyName('ID').AsString := MontaSelect1.ValoresChave[0];
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryCamposChave do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(MontaSelect1.ValoresChave[0]);
          Open;
     end;
     dbgrDados.DataSource := dtmRelDetalhes.ds;
  end;
  frmAguarde.Apaga;
end;

procedure TfrmDetalhes.fcOutlookBar1OutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dbgrDados.DataSource := dtmRelDetalhes.ds;
end;

procedure TfrmDetalhes.fcOutlookBar1OutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dbgrDados.DataSource := dtmRelDetalhes.dsCampo;
end;

procedure TfrmDetalhes.fcOutlookBar1OutlookList1Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dbgrDados.DataSource := dtmRelDetalhes.dsFormula;
end;

procedure TfrmDetalhes.fcOutlookBar1OutlookList1Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dbgrDados.DataSource := dtmRelDetalhes.dsRegra;
end;

procedure TfrmDetalhes.fcOutlookBar1OutlookList1Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dbgrDados.DataSource := dtmRelDetalhes.dsVariavel;
end;

procedure TfrmDetalhes.fcOutlookBar1OutlookList1Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dbgrDados.DataSource := dtmRelDetalhes.dsPai;
end;

procedure TfrmDetalhes.fcOutlookBar1OutlookList1Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dbgrDados.DataSource := dtmRelDetalhes.dsCamposChave;
end;

procedure TfrmDetalhes.FormCreate(Sender: TObject);
begin
  inherited;
  { Preenche o ususario do MontaSelect de pesquisa de Regras }
  MontaSelect1.Filtro.Add ('( GRUPOREGRAUSUARIO.IDUSUARIO = '+
                           IntToStr(Sistema.IdUsuario)+')');
end;

procedure TfrmDetalhes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmRelDetalhes.Qry.Close;
  dtmRelDetalhes.QryCampo.Close;
  dtmRelDetalhes.QryCamposChave.Close;
  dtmRelDetalhes.QryFormula.Close;
  dtmRelDetalhes.QryPai.Close;
  dtmRelDetalhes.QryRegra.Close;
  dtmRelDetalhes.QryVariavel.Close;
end;

end.
