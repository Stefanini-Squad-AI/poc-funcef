//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_3
// Pendencia :
// SOL       :
// Desc      : Acerto no Tab Order e erro de refresh após inserir e cancelar
//******************************************************************************
// Data      : 12/02/2007
// Código    : AL_2
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação da Classe de Risco da Classe de Titulo
//******************************************************************************
// Data      : 27/11/2006
// Código    : AL_1
// Pendencia : 23861
// SOL       : 43516
// Desc      :Inclusão do Campo FLGUSAQTD na CLASSETITRENFIX para tratamento
//            no Calculo de Valores e arredondamentos para titulos que não
//            usam a quantidade
//******************************************************************************

unit FCadClasseTitRenFixMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, fcLabel, uInvestimento, uCtrlRendaFixa, uCtrlPadroes,
  uCmSqlParams, DBCtrls, Mask, DBaseDados, uMensErro, uSistema, uCMTypes,
  Menus, faMensagem,
  //AL_2
  wwdblook;

type
  TFrmCadClasseTitRenFixMT = class(TFrmCadastroGridMTInv)
    CMSqlParams1: TCMSqlParams;
    lblClasseTitRenFixa: TLabel;
    dbeDescClasseTitRenFix: TDBEdit;
    dbckFlgAtiva: TDBCheckBox;
    //AL_2
    lblClasseRisco: TLabel;
    dblkCarteiraRF: TwwDBLookupCombo;
    CdsClasseRisco: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_2
    procedure FormShow(Sender: TObject);
    //AL_3
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlRendaFixa     : TCtrlRendaFixa;
    procedure Seleciona(iIdClasse : Integer = -1);
  public
    { Public declarations }
  end;

var
  FrmCadClasseTitRenFixMT: TFrmCadClasseTitRenFixMT;
  iIdClasse : Integer;

implementation

{$R *.DFM}


procedure TFrmCadClasseTitRenFixMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.InitializeAs(Padroes);
   CtrlRendaFixa.CdsClasseRenFix := cds;
   Seleciona;
end;

procedure TFrmCadClasseTitRenFixMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlRendaFixa);
end;

procedure TFrmCadClasseTitRenFixMT.Seleciona(iIdClasse : Integer = -1);
begin
  cds.Data := CtrlRendaFixa.ListClasseRenFix;
end;

procedure TFrmCadClasseTitRenFixMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlRendaFixa.AplicaAtualClasseRenFix;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlRendaFixa.MessageInfo,'Erro',mtError,[mbOk],0);
  inherited;
   Seleciona;
end;

procedure TFrmCadClasseTitRenFixMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Seleciona(StrToInt(MontaSelect.ValoresChave[0]));
      Cds.Locate('IDCLASSETIT',MontaSelect.ValoresChave[0],[]);
   end;
end;

procedure TFrmCadClasseTitRenFixMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    CMeCadastroFind(Sender)
end;

procedure TFrmCadClasseTitRenFixMT.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if dbeDescClasseTitRenFix.CanFocus then
      dbeDescClasseTitRenFix.SetFocus;
   Cds.FieldByName('FLGATIVA').AsString := 'N';
   //AL_1
   Cds.FieldByName('FLGUSAQTD').AsString := 'S';
end;

procedure TFrmCadClasseTitRenFixMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if dbeDescClasseTitRenFix.CanFocus then
      dbeDescClasseTitRenFix.SetFocus;
end;

procedure TFrmCadClasseTitRenFixMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept :=((Trim( dbeDescClasseTitRenFix.Text) <> '') and (CmeCadastro.Operacao in [OpInserir,OpAlterar]));

  If not Accept Then
    MsgDlg('Descrição não Informada','Erro' ,MtError,[mbok],0);

end;

procedure TFrmCadClasseTitRenFixMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
  inherited;
end;

//AL_2
procedure TFrmCadClasseTitRenFixMT.FormShow(Sender: TObject);
begin
  inherited;
   CdsClasseRisco.Data   := CtrlRendaFixa.ListClasseRiscoRenFix;
   dbckFlgAtiva.Checked  := (cds.FieldByName('FLGATIVA').AsString = 'S');
end;

//AL_3
procedure TFrmCadClasseTitRenFixMT.bbtnCancelarClick(Sender: TObject);
begin
   Seleciona;
  inherited;
end;

end.
