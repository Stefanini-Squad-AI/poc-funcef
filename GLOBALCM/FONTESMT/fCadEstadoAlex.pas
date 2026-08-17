unit fCadEstadoAlex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCtrlEstadoAlex,
  uCtrlPadroes, wwdblook, Mask, DBCtrls, uSistema, dbasedados;

type
  TFrmCadEstadoAlex = class(TFrmCadastroMT)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label5: TLabel;
    cdsPais: TCMClientDataSet;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlEstadoAlex : TCtrlEstadoAlex;
    iIdEstado: integer;

    procedure abrirquery(const idcidades: integer);
    procedure Mensagem ( SMessageInfo: String);

  public
    { Public declarations }
  end;

var
  FrmCadEstadoAlex: TFrmCadEstadoAlex;

implementation

{$R *.DFM}

procedure TFrmCadEstadoAlex.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     iIdEstado := StrToInt(MontaSelect.ValoresChave[0]);
     abrirquery (iIdEstado);
  end;
end;

procedure TFrmCadEstadoAlex.abrirquery(const idcidades: integer);
begin
  Cds.Data := CtrlEstadoAlex.Seleciona (idcidades);
end;

procedure TFrmCadEstadoAlex.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEstadoAlex := TCtrlEstadoAlex.Create;

//  CtrlEstadoAlex.InitializeAs (Padroes);
  CtrlEstadoAlex.Initialize (DtmBaseDados.DbBaseDados,
                             True, Sistema.ConnectionType, Sistema.ConnectionSide,
                             Sistema.AppRemoteServer, true, Mensagem );


  CtrlEstadoAlex.CdsEstadoAlex := Cds;
  abrirquery (-1);

  cdsPais.Data := CtrlEstadoAlex.SelecionaPais;

end;

procedure TFrmCadEstadoAlex.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil (CtrlEstadoAlex);

  inherited;

end;

procedure TFrmCadEstadoAlex.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  //Accept := CtrlEstadoAlex.Gravar;
  Accept := CtrlEstadoAlex.Inserir;

//  if not Accept then ShowMessage(CtrlEstadoAlex.MessageInfo);

end;

procedure TFrmCadEstadoAlex.Mensagem(SMessageInfo: String);
begin
   ShowMessage (SMessageInfo);

end;

procedure TFrmCadEstadoAlex.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CtrlEstadoAlex.Excluir (iIdEstado);
end;

procedure TFrmCadEstadoAlex.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEstadoAlex.Alterar;

end;

end.
