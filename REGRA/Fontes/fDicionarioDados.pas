unit fDicionarioDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Buttons, Wwdbigrd, Grids, Wwdbgrid, DBCtrls, StdCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, Db,
  Wwdatsrc, DBTables, Wwquery, MontaSelect;

type
  TfrmDicionarioDados = class(TfrmSairAjuda)
    Panel1: TPanel;
    pnlBotoes: TPanel;
    bbtnCadGrupo: TBitBtn;
    bbtnVisao: TBitBtn;
    btnCadCampos: TBitBtn;
    QryGrupos: TwwQuery;
    dsGrupos: TwwDataSource;
    QryTable: TwwQuery;
    dsTable: TwwDataSource;
    QryCmpBd: TwwQuery;
    dsCmpBd: TwwDataSource;
    QryCampos: TwwQuery;
    dsCampos: TwwDataSource;
    Panel4: TPanel;
    dbgrd: TwwDBGrid;
    dbgrdIButton: TwwIButton;
    lblVisao: TLabel;
    MontaSelect1: TMontaSelect;
    btnConsulta: TBitBtn;
    lblCampos: TLabel;
    dbgrPrincipal: TwwDBGrid;
    btnAtualizar: TBitBtn;
    btnAssociarCamposGrupos: TBitBtn;
    procedure bbtnVisaoClick(Sender: TObject);
    procedure dsTableDataChange(Sender: TObject; Field: TField);
    procedure dsGruposDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCadGrupoClick(Sender: TObject);
    procedure btnCadCamposClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnAssociarCamposGruposClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDicionarioDados: TfrmDicionarioDados;

implementation

uses UMensErro, FTelaAut, fCadCampos, fCadGrupoArquivo, fAguarde,
  fAssociacaoGruposCampos;


{$R *.DFM}

procedure TfrmDicionarioDados.bbtnVisaoClick(Sender: TObject);
begin
  inherited;
  if dbgrPrincipal.DataSource = dsGrupos then begin
     lblVisao.Caption := 'Tabelas';
     dbgrPrincipal.DataSource := dsTable;
     dbgrd.DataSource := dsCampos;
  end else begin
     lblVisao.Caption := 'Grupos de Dados';
     dbgrPrincipal.DataSource := dsGrupos;
     dbgrd.DataSource := dsCmpBd;
  end;
end;

procedure TfrmDicionarioDados.dsTableDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with QryCampos do begin
       Close;
       ParambyName('DESCRICAO').AsString := QryTable.FieldbyName('DESCRICAO').AsString;
       Open;
  end;
end;

procedure TfrmDicionarioDados.dsGruposDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with QryCmpBd do begin
       Close;
       ParamByName('CODGRUPOARQUIVO').AsString :=
         QryGrupos.FieldbyName('CODGRUPOARQUIVO').AsString;
       Open;
  end;
end;

procedure TfrmDicionarioDados.FormCreate(Sender: TObject);
begin
  inherited;
  QryGrupos.Close;
  QryGrupos.Open;

  QryTable.Close;
  QryTable.Open;
end;

procedure TfrmDicionarioDados.bbtnCadGrupoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadGrupoArquivo,TfrmCadGrupoArquivo, False);
end;

procedure TfrmDicionarioDados.btnCadCamposClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCampos,TfrmCadCampos, False);
end;

procedure TfrmDicionarioDados.btnConsultaClick(Sender: TObject);
var
  vAux1, vAux2, vAux3, vAux4 : String;
begin
  inherited;
  MontaSelect1.Executar;
  Refresh;
  if MontaSelect1.RetornouValor then begin
     vAux1 := MontaSelect1.ValoresChave[0]; //CodGrupoArquivo
     vAux2 := MontaSelect1.ValoresChave[1]; //DescGrupoArquivo
     vAux3 := MontaSelect1.ValoresChave[2]; //IdCampo
     vAux4 := MontaSelect1.ValoresChave[3]; //ENTIDADE

     frmAguarde.Mostra('Pesquisando Dados ..');
     frmAguarde.Refresh;

     if dbgrPrincipal.DataSource = dsGrupos then begin
        QryGrupos.Locate('DESCRICAO', vAux2, []); //Caso seja pelo GRPARQUIVO
        with QryCmpBd do begin
             Close;
             ParamByName('CODGRUPOARQUIVO').AsString :=
               QryGrupos.FieldbyName('CODGRUPOARQUIVO').AsString;
             Open;
        end;
        if not QryCmpBd.Locate('IDCAMPO', vAux3, []) then
           MsgDlg('Campo '+vAux3+' não encontrado !','Atenção',mtError,[MbOk, mbHelp],0);
     end else begin
         QryTable.Locate('DESCRICAO', vAux4, []); //Caso seja pelo DDTABLE
         with QryCampos do begin
              Close;
              ParambyName('DESCRICAO').AsString := QryTable.FieldbyName('DESCRICAO').AsString;
              Open;
         end;
         if not QryCampos.Locate('IDCAMPO', vAux3, []) then
            MsgDlg('Campo '+vAux3+' não encontrado !','Atenção',mtError,[MbOk, mbHelp],0);
     end;
     frmAguarde.Apaga;
  end;

  dbgrPrincipal.Refresh;
  dbgrPrincipal.UpdateControlState;
  dbgrPrincipal.Realign;
  dbgrPrincipal.Show;
end;

procedure TfrmDicionarioDados.btnAtualizarClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Atualizando Dados ...');
  QryGrupos.Close;
  QryGrupos.Open;

  QryCampos.Close;
  QryCampos.Open;

  QryCmpBd.Close;
  QryCmpBd.Open;
  frmAguarde.Apaga;
end;

procedure TfrmDicionarioDados.btnAssociarCamposGruposClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmAssociacaoGruposCampos, tfrmAssociacaoGruposCampos, False);
end;

end.
