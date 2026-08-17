//******************************************************************************
// Data      : 27/09/2007
// Pendencia : 25924
// Motivo    : Implementação do Cadastro de Tipos de Indicadores (3 camadas)
//******************************************************************************

unit FCadParamEmissorMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, StdCtrls, Mask, wwdbedit, uCmSqlParams, Menus,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, fcLabel, faMensagem, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  uCtrlInvestimento,uCtrlPadroes,uMensErro,uCMTypes;

type
  TFrmCadParamEmissorMT = class(TFrmCadastroGridMTInv)
    Sql: TCMSqlParams;
    dbedescricao: TwwDBEdit;
    LbLDescParamEmissor: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    iIDParamEmissor: Integer;
    Investimento: TCtrlInvestimento;
    procedure AtualizaGrid;

  public
    { Public declarations }
  end;

var
  FrmCadParamEmissorMT: TFrmCadParamEmissorMT;

implementation


{$R *.DFM}

procedure TFrmCadParamEmissorMT.FormCreate(Sender: TObject);
begin
  inherited;
  Investimento := TCtrlInvestimento.Create;
  Investimento.InitializeAs(Padroes);
  Investimento.CdsParamEmissor := cds;
  cds.Data := Investimento.ListaParamEmissor;
end;

procedure TFrmCadParamEmissorMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(Investimento);
end;

procedure TFrmCadParamEmissorMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := Investimento.AplicaParamEmissor;

  If CmeCadastro.Operacao in [OpInserir] then
     iIDParamEmissor := Investimento.IDParamEmissor;

  if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + Investimento.MessageInfo,'Mensagem do Sistema',mtwarning,[mbOk],0);
  inherited;

  AtualizaGrid;
end;

procedure TFrmCadParamEmissorMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  Accept := True;
   if CmeCadastro.Operacao in [OpInserir,OpAlterar] then;
   begin
      if Trim(dbeDescricao.Text) = '' then
      begin
         MsgDlg('Informe a Descrição do Indicador.','Atenção' ,MtWarning,[mbok],0);
         if dbeDescricao.CanFocus then
            dbeDescricao.SetFocus;
         Accept := False;
         exit;
      end;
   end;
  inherited;
end;

procedure TFrmCadParamEmissorMT.AtualizaGrid;
begin
  Cds.Data := Investimento.ListaParamEmissor;
  If iIdParamEmissor > 0 then
     Cds.Locate('IDPARAMEMISSOR',iIDParamEmissor,[]);
end;

procedure TFrmCadParamEmissorMT.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
end;

procedure TFrmCadParamEmissorMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  AtualizaGrid;
end;

procedure TFrmCadParamEmissorMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
      Cds.Locate('IDPARAMEMISSOR',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadParamEmissorMT.sbtnAlterarClick(Sender: TObject);
begin
  // Pegando o Id antes da alteração para posicionar no grid
  if Not Cds.IsEmpty then
     iIDParamEmissor := cds.FieldByName('IDPARAMEMISSOR').AsInteger;
  inherited;

end;

procedure TFrmCadParamEmissorMT.dbGrdDblClick(Sender: TObject);
begin
  // Pegando o Id antes da alteração para posicionar no grid
  if Not Cds.IsEmpty then
     iIDParamEmissor := cds.FieldByName('IDPARAMEMISSOR').AsInteger;
  inherited;

end;

procedure TFrmCadParamEmissorMT.sbtnApagarClick(Sender: TObject);
begin
  Investimento.MDIDParamEmisssor := Cds.fieldbyname('IDPARAMEMISSOR').AsInteger;
  If Investimento.PermiteExclusaoParamEmissor then
     inherited
  else
     MsgDlg('Ocorreu um erro na exclusão do Registro.' + #13 +
             'Motivo: Não é possível excluir Indicadores associados a um Emissor','Mensagem do Sistema',mtwarning,[mbOk],0);

end;

end.
