//******************************************************************************
// Data      : 07/06/2006
// Código    : AL_2
// Pendencia :
// SOL       :
// Motivo    : Ajuste na consulta e no filtro por carteira para trazer somente as
//             carteiras gerenciais
//******************************************************************************
// Data     : 24/11/2005
// Codigo   : AL_1
// Descrição: Criação de Botão de Filtro e de Procura
//******************************************************************************

unit FCadEveXCart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCsInv, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, faMensagem, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, wwdblook;

type
  TfrmCadEveXCart = class(TFrmCadastroGridCSInv)
    qryCarteira: TwwQuery;
    qryCarteiraIDCARTEIRA: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraIDCARTEIRAGERENC: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryDESCCARTINVEST: TStringField;
    qryDESCCAIXACOTA: TStringField;
    qryIDCARTEIRAXEVENTO: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDCARTEIRAGERENC: TFloatField;
    qryIDEVENTOCAIXACOTA: TFloatField;
    qryIDCARTEIRA: TStringField;
    qryEveCXCota: TwwQuery;
    qryEveCXCotaDESCCAIXACOTA: TStringField;
    qryEveCXCotaIDEVENTOCAIXACOTA: TFloatField;
    Label1: TLabel;
    dblCarteira: TwwDBLookupCombo;
    Label3: TLabel;
    dblEveCxCota: TwwDBLookupCombo;
    MontaSelectFiltrar: TMontaSelect;
    sbtnFiltrar: TToolbarButton97;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnFiltrarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(S : LongInt);
  public
    { Public declarations }
  end;

var
  frmCadEveXCart: TfrmCadEveXCart;

implementation

Uses UDataBase, uMensErro, UBibliotecaInvest, UOperComum;

{$R *.DFM}

procedure TfrmCadEveXCart.Sel(S: Integer);
begin
  OperComum.LimpaParametros(qry);
  if S > 0 then
     qry.ParamByName('IDCARTEIRA').AsInteger := S;
  qry.Open;
end;

procedure TfrmCadEveXCart.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if dblCarteira.CanFocus then
     dblCarteira.SetFocus;
end;

procedure TfrmCadEveXCart.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if dblCarteira.CanFocus then
     dblCarteira.SetFocus;
end;

procedure TfrmCadEveXCart.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

procedure TfrmCadEveXCart.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  Accept := True;
  if dblCarteira.LookupValue = '' then
  begin
     MsgDlg('Carteira não selecionada','Mensagem do Sistema', mtWarning,[mbOK],0);
     dblCarteira.SetFocus;
     Accept := False;
  end;
  if dblEveCxCota.LookupValue = '' then
  begin
     MsgDlg('Evento Caixa/Cota não selecionada','Mensagem do Sistema', mtWarning,[mbOK],0);
     dblEveCxCota.SetFocus;
     Accept := False;
  end;

  if Accept then
  begin
     if qry.State = dsInsert then
        qryIDCARTEIRAXEVENTO.AsInteger := LeUltRegistro(nil, 'CARTEIRAXEVENTO');

     if qry.State in [dsInsert, dsEdit] then
     begin
        qryIDCARTEIRAINVEST.AsInteger := qryCarteiraIDCARTEIRAINVEST.AsInteger;
        if qryCarteiraIDCARTEIRAGERENC.IsNull then
           qryIDCARTEIRAGERENC.Clear
        else
           qryIDCARTEIRAGERENC.AsInteger := qryCarteiraIDCARTEIRAGERENC.AsInteger;
     end;
  end;

  inherited;

end;

procedure TfrmCadEveXCart.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
  Sel(OperComum.IIF(qry.ParamByName('IDCARTEIRA').IsNull, -1, qry.ParamByName('IDCARTEIRA').AsInteger));
end;

procedure TfrmCadEveXCart.sbtnFiltrarClick(Sender: TObject);
begin
   //AL_1
   Sel(-1);
   inherited;
   MontaSelectFiltrar.Executar;
   if MontaSelectFiltrar.RetornouValor then
      Sel(StrToInt(MontaSelectFiltrar.ValoresChave[0]));
   sbtnFiltrar.Down := False;
end;

procedure TfrmCadEveXCart.CmeCadastroFind(Sender: TObject);
begin
   // AL_1
   Sel(-1);
   inherited;
   if MontaSelect.RetornouValor then
      qry.Locate('IDCARTEIRAXEVENTO', StrToInt(MontaSelect.ValoresChave[0]), []);
end;

end.
