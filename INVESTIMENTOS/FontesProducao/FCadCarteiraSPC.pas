unit fCadCarteiraSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, Mask, DBCtrls;

type
  TfrmCadCarteiraSPC = class(TfrmCadastroCSInv)
    qryIDCARTEIRASPC: TFloatField;
    qryDESCARTEIRASPC: TStringField;
    Label1: TLabel;
    dbeNomeCarteira: TDBEdit;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(N : Longint);
   
  public
    { Public declarations }
  end;

var
  frmCadCarteiraSPC: TfrmCadCarteiraSPC;

implementation

uses UOperComum, uMensErro, UDataBase;

{$R *.DFM}

{ TfrmCadCarteiraSPC }

procedure TfrmCadCarteiraSPC.Sel(N: Integer);
begin
  OperComum.LimpaParametros(qry);
  qry.ParamByName('IDCARTEIRASPC').AsInteger := N;
  qry.Open;
end;

procedure TfrmCadCarteiraSPC.FormShow(Sender: TObject);
begin
  inherited;
   Sel(-1);
end;

procedure TfrmCadCarteiraSPC.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := False;
   if Trim(dbeNomeCarteira.Text) = '' then
   begin
     MsgDlg('O Nome da Carteira não foi Informado .', 'Warning', mtWarning, [mbOk], 0);
     dbeNomeCarteira.SetFocus;
   end
   else
   begin
      Accept := True;
      if qry.State = dsInsert then
         qryIDCARTEIRASPC.AsInteger := LeUltRegistro(nil, 'CARTEIRASPC');
   end;
end;

procedure TfrmCadCarteiraSPC.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCarteiraSPC.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if dbeNomeCarteira.CanFocus then
      dbeNomeCarteira.SetFocus;
end;

procedure TfrmCadCarteiraSPC.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if dbeNomeCarteira.CanFocus then
      dbeNomeCarteira.SetFocus;
end;

procedure TfrmCadCarteiraSPC.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
end;

end.
