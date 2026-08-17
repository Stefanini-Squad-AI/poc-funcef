{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. WO...........: WO7622
Data............: 02/02/2024
Responsável.....: Helen V Bianchi
Descrição.......: Criação da funcionalidade Cadastro -> Contrato x Usuários.
-------------------------------------------------------------------------------}

unit FCadContrXUsuMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, uCmSqlParams,uCtrlContrXUsuario, uFuncoesUteis;

type
  TfrmCadContrXUsuMT = class(TFrmCadastroMT)
    pnlDados: TPanel;
    pnlTopo: TPanel;
    pnlContratosDisp: TPanel;
    Panel2: TPanel;
    pnlTituloContratosDisp: TPanel;
    pnlTituloContratosSel: TPanel;
    grdSelecionados: TwwDBGrid;
    Label1: TLabel;
    EdUsuario: TEdit;
    spTeste: TCMSqlParams;
    cdsDisponiveis: TCMClientDataSet;
    dsDisponiveis: TwwDataSource;
    pnlSeparacao: TPanel;
    BtnAdicionaTudo: TSpeedButton;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    edtUsuario: TEdit;
    lblUsuario: TLabel;
    edtNome: TEdit;
    lblNome: TLabel;
    grdDisponiveis: TwwDBGrid;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure grdCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure edtUsuarioChange(Sender: TObject);
  private
    { Private declarations }
    CtrlContrXUsuario : TCtrlContrXUsuario;
    procedure HabDesBotoes;
  public
    { Public declarations }
  end;

var
  frmCadContrXUsuMT: TfrmCadContrXUsuMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadContrXUsuMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlContrXUsuario
   CtrlContrXUsuario:=TCtrlContrXUsuario.Create;
   CtrlContrXUsuario.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlContrXUsuario.CdsContrXUsuario:=Cds;

   //Carrega Cds's
   cdsDisponiveis.Data:=CtrlContrXUsuario.ListUsuariosxContrato(-1,False); //vazio
   Cds.Data:=cdsDisponiveis.Data; //vazio
end;

procedure TfrmCadContrXUsuMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       //Carrega Cds's
       cdsDisponiveis.Close;
       Cds.Close;
       cdsDisponiveis.Data:=CtrlContrXUsuario.ListUsuariosxContrato(StrToFloat(MontaSelect.ValoresChave[0]), True);
       Cds.Data:=CtrlContrXUsuario.ListUsuariosxContrato(StrToFloat(MontaSelect.ValoresChave[0]), False);
       EdUsuario.Text:=MontaSelect.ValoresChave[1];
       HabDesBotoes;
    end;
end;

procedure TfrmCadContrXUsuMT.CmeCadastroInsert(Sender: TObject);
begin
   CmeCadastro.RepetirInsert:=False;
   if (Trim(EdUsuario.Text)<>'') then
       Cds.Cancel
   else
    begin
       MsgDlg('Não há Nenhum usuário selecionado','Atenção',mtWarning,[mbOk],0);
       bbtnCancelar.Click;
    end;
end;

procedure TfrmCadContrXUsuMT.CmeCadastroConfirma(Sender: TObject);
begin
   if not(CtrlContrXUsuario.AplicaAtualContrXUsuario) then
    begin
       MsgDlg(CtrlContrXUsuario.MessageInfo,'Erro',mtError,[mbOK],0);
       Abort;
    end
   else
    inherited;

   //Carrega Cds's
   cdsDisponiveis.Close;
   Cds.Close;
   cdsDisponiveis.Data:=CtrlContrXUsuario.ListUsuariosxContrato(StrToFloat(MontaSelect.ValoresChave[0]), True);
   Cds.Data:=CtrlContrXUsuario.ListUsuariosxContrato(StrToFloat(MontaSelect.ValoresChave[0]),False);
   EdUsuario.Text:=MontaSelect.ValoresChave[1];
end;

procedure TfrmCadContrXUsuMT.BtnAdicionaTudoClick(Sender: TObject);
begin
   Cds.DisableControls;
   cdsDisponiveis.DisableControls;
   try
      cdsDisponiveis.First;
      while not(cdsDisponiveis.IsEmpty) do
      begin
         Cds.Append;
         Cds.FieldByName('NOMEUSUARIO').AsString:=cdsDisponiveis.FieldByName('NOMEUSUARIO').AsString;
         Cds.FieldByName('IDCONTRATO').AsFloat:=cdsDisponiveis.FieldByName('IDCONTRATO').AsFloat;
         Cds.FieldByName('IDUSUARIO').AsFloat:=cdsDisponiveis.FieldByName('IDUSUARIO').AsFloat;
         Cds.FieldByName('NOME').AsString:=cdsDisponiveis.FieldByName('NOME').AsString;
         Cds.Post;
         cdsDisponiveis.Delete;
      end;
   finally
      Cds.EnableControls;
      cdsDisponiveis.EnableControls;
   end;
   HabDesBotoes;
end;

procedure TfrmCadContrXUsuMT.btnAdicionaClick(Sender: TObject);
begin
   Cds.Append;
   Cds.FieldByName('NOMEUSUARIO').AsString:=cdsDisponiveis.FieldByName('NOMEUSUARIO').AsString;
   Cds.FieldByName('IDCONTRATO').AsFloat:=cdsDisponiveis.FieldByName('IDCONTRATO').AsFloat;
   Cds.FieldByName('IDUSUARIO').AsFloat:=cdsDisponiveis.FieldByName('IDUSUARIO').AsFloat;
   Cds.FieldByName('NOME').AsString    :=cdsDisponiveis.FieldByName('NOME').AsString;
   Cds.Post;
   cdsDisponiveis.Delete;
   HabDesBotoes;
end;

procedure TfrmCadContrXUsuMT.BtnRemoveClick(Sender: TObject);
begin
   cdsDisponiveis.Append;
   cdsDisponiveis.FieldByName('NOMEUSUARIO').AsString:=Cds.FieldByName('NOMEUSUARIO').AsString;
   cdsDisponiveis.FieldByName('IDCONTRATO').AsFloat:=Cds.FieldByName('IDCONTRATO').AsFloat;
   cdsDisponiveis.FieldByName('IDUSUARIO').AsFloat:=Cds.FieldByName('IDUSUARIO').AsFloat;
   cdsDisponiveis.FieldByName('NOME').AsString:=Cds.FieldByName('NOME').AsString;
   cdsDisponiveis.Post;
   Cds.Delete;
   HabDesBotoes;
end;

procedure TfrmCadContrXUsuMT.btnRemoveTudoClick(Sender: TObject);
begin
   Cds.DisableControls;
   cdsDisponiveis.DisableControls;
   try
      Cds.First;
      while not(Cds.IsEmpty) do
      begin
         cdsDisponiveis.Append;
         cdsDisponiveis.FieldByName('NOMEUSUARIO').AsString:=Cds.FieldByName('NOMEUSUARIO').AsString;
         cdsDisponiveis.FieldByName('IDCONTRATO').AsFloat:=Cds.FieldByName('IDCONTRATO').AsFloat;
         cdsDisponiveis.FieldByName('IDUSUARIO').AsFloat:=Cds.FieldByName('IDUSUARIO').AsFloat;
         cdsDisponiveis.FieldByName('NOME').AsString:=Cds.FieldByName('NOME').AsString;
         cdsDisponiveis.Post;
         Cds.Delete;
      end;
   finally
      Cds.EnableControls;
      cdsDisponiveis.EnableControls;
   end;
   HabDesBotoes;
end;

procedure TfrmCadContrXUsuMT.HabDesBotoes;
begin
   btnAdiciona.Enabled:=not(cdsDisponiveis.IsEmpty);
   BtnAdicionaTudo.Enabled:=not(cdsDisponiveis.IsEmpty);
   BtnRemove.Enabled:=not(Cds.IsEmpty);
   btnRemoveTudo.Enabled:=not(Cds.IsEmpty);
   EdtUsuario.Text := '';
   edtNome.Text    := '';
end;

procedure TfrmCadContrXUsuMT.FormResize(Sender: TObject);
begin
   inherited;
   pnlContratosDisp.Width:=(pnlDados.Width-pnlSeparacao.Width) div 2;
end;

procedure TfrmCadContrXUsuMT.grdCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   //Faz com que as linhas do grid tenham cores alternadas
   if (State<>[gdSelected]) then
    begin
       if not(Highlight) then
        begin
         if (((Sender as TwwDBGrid).CalcCellRow mod 2)=0) then
            ABrush.color:=clwhite
         else
            ABrush.Color:=$00C0FFFF; //Amarelo Bebê
      end;
    end
   else
    begin
       ABrush.Color:=clHighLight;
       AFont.Color:=clHighLightText;
    end;
end;

procedure TfrmCadContrXUsuMT.edtUsuarioChange(Sender: TObject);
var Filtro : String;
begin
  inherited;

  if edtUsuario.text <> '' then
     Filtro := 'NOMEUSUARIO LIKE ''%' + edtUsuario.text + '%''';

  if edtNome.text <> '' then
     Filtro :=Filtro +  IFF(Filtro = '','',' AND ') +  'NOME LIKE ''%' + edtNome.text + '%''';

   cdsDisponiveis.Filtered      := False;
   dsDisponiveis.DataSet.Filter := Filtro;
   cdsDisponiveis.Filtered      := True;

end;

end.
