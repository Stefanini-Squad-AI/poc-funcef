unit fCadLocalAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList, Db,
  Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook, uDataBase, usistema;

type
  TfrmCadLocalAtend = class(TfrmCadastroCS)
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    qryIDLOCALATEND: TFloatField;
    qryDESCLOCALATEND: TStringField;
    qryIDTIPOATEND: TFloatField;
    qryFormaAtend: TwwQuery;
    qryFormaAtendIDTIPOATEND: TFloatField;
    qryFormaAtendNOME: TStringField;
    qryFormaAtendFLGEMITERUBS: TStringField;
    dblkFormaAtend: TwwDBLookupCombo;
    Label13: TLabel;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadLocalAtend: TfrmCadLocalAtend;

implementation

{$R *.DFM}

procedure TfrmCadLocalAtend.FormShow(Sender: TObject);
begin
  inherited;
  qryFormaAtend.Open;
  qry.close;
  qry.ParamByName('IDLOCALATEND').asInteger := -1;
  qry.Open;
end;

procedure TfrmCadLocalAtend.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if montaselect.RetornouValor then
  begin
    qry.close;
    qry.ParamByName('IDLOCALATEND').asInteger := strToIntDef(MontaSelect.ValoresChave[0], -1);
    qry.Open;

    dblkFormaAtend.LookupValue := MontaSelect.ValoresChave[2];
    dblkFormaAtend.Text        := MontaSelect.ValoresChave[3];
  end;
end;

procedure TfrmCadLocalAtend.CmeCadastroConfirma(Sender: TObject);
begin
  if not Sistema.GravaLogOperacoes('Operação de Cadastro de Locais de Atendimento') then
  begin
    Raise Exception.Create('Não foi possível Gravar o Log');
    exit;
  end;

  if QRY.State = dsInsert then
    qryIDLOCALATEND.asInteger :=  LeUltRegistro(nil,'IDLOCALATEND');

  if QRY.State in [dsInsert, dsEdit] then
  begin
    if dblkFormaAtend.Text <> '' then
      qryIDTIPOATEND.asInteger := strToIntDef(dblkFormaAtend.LookupValue, 1000)
    else
      qryIDTIPOATEND.Clear;
  end;

  inherited;

  qryFormaAtend.Close;
  qryFormaAtend.Open;
  qry.close;
  qry.ParamByName('IDLOCALATEND').asInteger := -1;
  qry.Open;
  DblkFormaAtend.LookupValue := '';
  DblkFormaAtend.Text := '';
  bbtnCancelarClick(self);
  CmeCadastro.AtualizaBotoes(Self);

end;

end.
