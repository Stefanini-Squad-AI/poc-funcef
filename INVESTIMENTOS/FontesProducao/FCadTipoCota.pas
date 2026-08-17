//*******************************************************************************
//Data	 	 :      06/04/2004
//Função	 :      Cadastro do Tipo de Cotas para Fundos de Direito Creditórios
//*******************************************************************************

unit FCadTipoCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, Mask, wwdbedit;

type
  TfrmCadTipoCota = class(TfrmCadastroCSInv)
    dbeDescTipoCota: TwwDBEdit;
    Label1: TLabel;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(S1 : Integer);
  public
    { Public declarations }
  end;

var
  frmCadTipoCota: TfrmCadTipoCota;

implementation

Uses UDataBase, uMensErro, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmCadTipoCota.Sel(S1 : Integer);
begin
  qry.Close;
  qry.ParamByName('IDTIPOCOTA').AsInteger := S1;
  qry.Open;
end;

procedure TfrmCadTipoCota.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if dbeDescTipoCota.CanFocus then
     dbeDescTipoCota.SetFocus;
end;

procedure TfrmCadTipoCota.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if dbeDescTipoCota.CanFocus then
     dbeDescTipoCota.SetFocus;
end;

procedure TfrmCadTipoCota.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
     CmeCadastro.AtualizaBotoes(Self);
  end;
  if dbeDescTipoCota.CanFocus then
     dbeDescTipoCota.SetFocus;
end;

procedure TfrmCadTipoCota.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipoCota.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  If Trim(dbeDescTipoCota.Text) = '' Then
  begin
     MsgDlg('Descrição do Tipo de Cota não preenchida','Erro',mtError,[mbOK],0);
     dbeDescTipoCota.SetFocus;
  end else Accept := True;
end;

procedure TfrmCadTipoCota.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  if qry.State = dsInsert Then
     qry.FieldByName('IDTIPOCOTA').AsInteger := LeUltRegistro(nil, 'TIPOCOTA');
  SelectFirst;
end;

end.
