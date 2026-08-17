{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26186
Responsável : Gustavo Mendes
Data        : 17/04/2008
Descrição   : A lista de contratos selecionados é apagada quanto clica no botão
              Atualizar.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadUsuXContrMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, uCmSqlParams, uCtrlUsuXContrato;

type
  TfrmCadUsuXContrMT = class(TFrmCadastroMT)
    pnlDados: TPanel;
    pnlTopo: TPanel;
    pnlContratosDisp: TPanel;
    pnlSeparacao: TPanel;
    Panel2: TPanel;
    pnlTituloContratosDisp: TPanel;
    pnlTituloContratosSel: TPanel;
    BtnAdicionaTudo: TSpeedButton;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdDisponiveis: TwwDBGrid;
    grdSelecionados: TwwDBGrid;
    Label1: TLabel;
    EdUsuario: TEdit;
    spTeste: TCMSqlParams;
    cdsDisponiveis: TCMClientDataSet;
    dsDisponiveis: TwwDataSource;
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
  private
    { Private declarations }
    CtrlUsuXContrato : TCtrlUsuXContrato;
    procedure HabDesBotoes;
  public
    { Public declarations }
  end;

var
  frmCadUsuXContrMT: TfrmCadUsuXContrMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadUsuXContrMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlUsuXContrato
   CtrlUsuXContrato:=TCtrlUsuXContrato.Create;
   CtrlUsuXContrato.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlUsuXContrato.CdsUsuXContrato:=Cds;

   //Carrega Cds's
   cdsDisponiveis.Data:=CtrlUsuXContrato.ListContratosxUsuario(-1,-1,-1,'',False); //vazio
   Cds.Data:=cdsDisponiveis.Data; //vazio
end;

procedure TfrmCadUsuXContrMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       //Carrega Cds's
       cdsDisponiveis.Close;
       Cds.Close;
       cdsDisponiveis.Data:=CtrlUsuXContrato.ListContratosxUsuario(Sistema.IdEmpresa,0,
                                                                   StrToFloat(MontaSelect.ValoresChave[0]),
                                                                   '', True);
       Cds.Data:=CtrlUsuXContrato.ListContratosxUsuario(Sistema.IdEmpresa,0,
                                                        StrToFloat(MontaSelect.ValoresChave[0]),
                                                        '', False);
       EdUsuario.Text:=MontaSelect.ValoresChave[1];
       HabDesBotoes;
    end;
end;

procedure TfrmCadUsuXContrMT.CmeCadastroInsert(Sender: TObject);
begin
   CmeCadastro.RepetirInsert:=False;
   //inherited;  Gustavo Mendes - 26186
   if (Trim(EdUsuario.Text)<>'') then
       Cds.Cancel
   else
    begin
       MsgDlg('Não há Nenhum usuário selecionado','Atenção',mtWarning,[mbOk],0);
       bbtnCancelar.Click;
    end;
end;

procedure TfrmCadUsuXContrMT.CmeCadastroConfirma(Sender: TObject);
begin
   if not(CtrlUsuXContrato.AplicaAtualUsuXContrato) then
    begin
       MsgDlg(CtrlUsuXContrato.MessageInfo,'Erro',mtError,[mbOK],0);
       Abort;
    end
   else
    inherited;

   //Carrega Cds's
   cdsDisponiveis.Close;
   Cds.Close;
   cdsDisponiveis.Data:=CtrlUsuXContrato.ListContratosxUsuario(Sistema.IdEmpresa,0,
                                                               StrToFloat(MontaSelect.ValoresChave[0]),
                                                               '', True);
   Cds.Data:=CtrlUsuXContrato.ListContratosxUsuario(Sistema.IdEmpresa,0,
                                                    StrToFloat(MontaSelect.ValoresChave[0]),
                                                    '', False);
   EdUsuario.Text:=MontaSelect.ValoresChave[1];
end;

procedure TfrmCadUsuXContrMT.BtnAdicionaTudoClick(Sender: TObject);
begin
   Cds.DisableControls;
   cdsDisponiveis.DisableControls;
   try
      cdsDisponiveis.First;
      while not(cdsDisponiveis.IsEmpty) do
      begin
         Cds.Append;
         Cds.FieldByName('NOMECONTRATO').AsString:=cdsDisponiveis.FieldByName('NOMECONTRATO').AsString;
         Cds.FieldByName('IDCONTRATO').AsFloat:=cdsDisponiveis.FieldByName('IDCONTRATO').AsFloat;
         Cds.FieldByName('IDUSUARIO').AsFloat:=cdsDisponiveis.FieldByName('IDUSUARIO').AsFloat;
         Cds.Post;
         cdsDisponiveis.Delete;
      end;
   finally
      Cds.EnableControls;
      cdsDisponiveis.EnableControls;
   end;
   HabDesBotoes;
end;

procedure TfrmCadUsuXContrMT.btnAdicionaClick(Sender: TObject);
begin
   Cds.Append;
   Cds.FieldByName('NOMECONTRATO').AsString:=cdsDisponiveis.FieldByName('NOMECONTRATO').AsString;
   Cds.FieldByName('IDCONTRATO').AsFloat:=cdsDisponiveis.FieldByName('IDCONTRATO').AsFloat;
   Cds.FieldByName('IDUSUARIO').AsFloat:=cdsDisponiveis.FieldByName('IDUSUARIO').AsFloat;
   Cds.Post;
   cdsDisponiveis.Delete;
   HabDesBotoes;
end;

procedure TfrmCadUsuXContrMT.BtnRemoveClick(Sender: TObject);
begin
   cdsDisponiveis.Append;
   cdsDisponiveis.FieldByName('NOMECONTRATO').AsString:=Cds.FieldByName('NOMECONTRATO').AsString;
   cdsDisponiveis.FieldByName('IDCONTRATO').AsFloat:=Cds.FieldByName('IDCONTRATO').AsFloat;
   cdsDisponiveis.FieldByName('IDUSUARIO').AsFloat:=Cds.FieldByName('IDUSUARIO').AsFloat;
   cdsDisponiveis.Post;
   Cds.Delete;
   HabDesBotoes;
end;

procedure TfrmCadUsuXContrMT.btnRemoveTudoClick(Sender: TObject);
begin
   Cds.DisableControls;
   cdsDisponiveis.DisableControls;
   try
      Cds.First;
      while not(Cds.IsEmpty) do
      begin
         cdsDisponiveis.Append;
         cdsDisponiveis.FieldByName('NOMECONTRATO').AsString:=Cds.FieldByName('NOMECONTRATO').AsString;
         cdsDisponiveis.FieldByName('IDCONTRATO').AsFloat:=Cds.FieldByName('IDCONTRATO').AsFloat;
         cdsDisponiveis.FieldByName('IDUSUARIO').AsFloat:=Cds.FieldByName('IDUSUARIO').AsFloat;
         cdsDisponiveis.Post;
         Cds.Delete;
      end;
   finally
      Cds.EnableControls;
      cdsDisponiveis.EnableControls;
   end;
   HabDesBotoes;
end;

procedure TfrmCadUsuXContrMT.HabDesBotoes;
begin
   btnAdiciona.Enabled:=not(cdsDisponiveis.IsEmpty);
   BtnAdicionaTudo.Enabled:=not(cdsDisponiveis.IsEmpty);
   BtnRemove.Enabled:=not(Cds.IsEmpty);
   btnRemoveTudo.Enabled:=not(Cds.IsEmpty);
end;

procedure TfrmCadUsuXContrMT.FormResize(Sender: TObject);
begin
   inherited;
   pnlContratosDisp.Width:=(pnlDados.Width-pnlSeparacao.Width) div 2;
end;

procedure TfrmCadUsuXContrMT.grdCalcCellColors(Sender: TObject;
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

end.
