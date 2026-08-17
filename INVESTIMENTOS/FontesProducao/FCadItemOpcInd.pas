unit FCadItemOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, Mask, wwdbedit,
  wwdblook;

type
  TfrmCadItemOpcInd = class(TfrmCadastroCSInv)
    lblDescItem: TLabel;
    dbeDescItem: TwwDBEdit;
    qryIDITEMOPCIND: TFloatField;
    qryDESITEMOPCIND: TStringField;
    qryIDREGRA: TFloatField;
    dblRegra: TwwDBLookupCombo;
    lblRegra: TLabel;
    qryRegra: TwwQuery;
    qryRegraIDREGRA: TFloatField;
    qryRegraNOMEREGRA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(N : Longint);
  public
    { Public declarations }
  end;

var
  frmCadItemOpcInd: TfrmCadItemOpcInd;

implementation

{$R *.DFM}

uses UOperComum,UBibliotecaInvest,uMensErro, UDataBase;

procedure TfrmCadItemOpcInd.FormShow(Sender: TObject);
begin
  inherited;
   Sel(-1);

   OperComum.LimpaParametros(qryRegra);
   qryRegra.ParamByName('IDTIPOREGRA').AsInteger := pRPI.IDTIPOREGRARV;
   qryRegra.Open;
end;

procedure TfrmCadItemOpcInd.Sel(N : Longint);
begin
  OperComum.LimpaParametros(qry);
  if N <> -1 then
     qry.ParamByName('IDITEMOPCIND').AsInteger := N;
  qry.Open;
end;

procedure TfrmCadItemOpcInd.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if dbeDescItem.CanFocus then
      dbeDescItem.SetFocus;
end;

procedure TfrmCadItemOpcInd.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := False;
   if Trim(dbeDescItem.Text) = '' then
   begin
     MsgDlg('Falta a descrição do Item.', 'Mensagem do Sistema',mtWarning, [mbOk], 0);
     if dbeDescItem.CanFocus then
        dbeDescItem.SetFocus;
     Exit;
   end;
   if Trim(dblRegra.Text) = '' then
   begin
     MsgDlg('Falta a Regra de Cálculo do Item.', 'Mensagem do Sistema',mtWarning, [mbOk], 0);
     if dblRegra.CanFocus then
        dblRegra.SetFocus;
     Exit;
   end;
   Accept := True;
   if qry.State = dsInsert then
      qryIDITEMOPCIND.AsInteger := LeUltRegistro(nil, 'ITEMOPCIND');
end;

procedure TfrmCadItemOpcInd.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadItemOpcInd.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if dbeDescItem.CanFocus then
      dbeDescItem.SetFocus;
end;

end.
