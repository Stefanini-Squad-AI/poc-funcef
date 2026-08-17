unit fCadObraTipoEtapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList;

type
  TfrmCadObraTipoEtapa = class(TfrmCadastroCS)
    dbeDescTipSaiTmp: TwwDBEdit;
    Label1: TLabel;
    qryIDOBRATIPOETAPA: TFloatField;
    qryDESCOBRATIPOETAPA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadObraTipoEtapa: TfrmCadObraTipoEtapa;

implementation

{$R *.DFM}

uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema;

procedure TfrmCadObraTipoEtapa.FormCreate(Sender: TObject);
begin
   inherited;
   if not qry.Prepared then qry.Prepare;
   qry.Open;
end;

procedure TfrmCadObraTipoEtapa.CmeCadastroFind(Sender: TObject);
var
   iIdObraTipoEtapa : Integer;
begin
   if (MontaSelect.RetornouValor) then
   begin
      iIdObraTipoEtapa := strtoint(MontaSelect.ValoresChave[0]);
      qry.Locate('IDOBRATIPOETAPA', iIdObraTipoEtapa,[]);
   end;
end;

procedure TfrmCadObraTipoEtapa.bbtnConfirmarClick(Sender: TObject);
begin
   if trim(dbeDescTipSaiTmp.Text) = '' then
   begin
      MsgDlg('Obrigatório preencher a Descrição!','Erro',mtError,[mbOK],0);
      dbeDescTipSaiTmp.SetFocus;
      exit;
   end;
   if (qryIDOBRATIPOETAPA.AsInteger <= 0) then
      qryIDOBRATIPOETAPA.AsInteger := LeUltRegistro(nil,'CAFOBRATIPOETAPA');
   inherited;
end;

procedure TfrmCadObraTipoEtapa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qry.UnPrepare;
end;

end.
