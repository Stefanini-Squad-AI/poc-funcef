unit FCadTipoCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, DBCtrls,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, CMwwQuery,
  Mask, wwdbedit, TB97Ctls, TB97Tlbr, FCadastroGrid, MontaSelect, IvDictio,
  IvMulti, IvEMulti, CmEventosCadastro, ImgList;

type
  TfrmCadTipoCliente = class(TfrmCadastroGridCS)
    lblDescricao: TLabel;
    dbedDescricao: TwwDBEdit;
    qryIDTIPOCLIENTE: TFloatField;
    qryDESCRICAO: TStringField;
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoCliente: TfrmCadTipoCliente;

implementation

uses uMensErro,uDataBase, DBaseDados,UAutorizacao, uSistema;

{$R *.DFM}

procedure TfrmCadTipoCliente.CmeCadastroInsert(Sender: TObject);
begin
   Inherited;
   dbedDescricao.SetFocus;
   qry.FieldByName('IDTIPOCLIENTE').AsInteger:=LeUltRegistro(nil,'TIPOCLIENTE');
end;

procedure TfrmCadTipoCliente.CmeCadastroEdit(Sender: TObject);
Begin
  inherited;
  dbedDescricao.SetFocus;
end;

procedure TfrmCadTipoCliente.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Qry.Locate('IDTIPOCLIENTE',StrToInt(MontaSelect.ValoresChave[0]),[]);
End;

procedure TfrmCadTipoCliente.bbtnConfirmarClick(Sender: TObject);
begin
   if trim(dbedDescricao.text) = '' then
     begin
       MsgDlg('Obrigatório preencher a descrição','Atenção',mtError,[mbOk],0);
       dbedDescricao.SetFocus;
       exit;
     end;
   inherited;
end;

end.
