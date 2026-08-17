unit FCadProdServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdblook, DBCtrls, uCtrlProdServ, uCmSqlParams;

type
  TfrmCadProdServ = class(TFrmCadastroMT)
    Label1: TLabel;
    dbmemNomeServ: TDBMemo;
    dbrgTipoObjeto: TDBRadioGroup;
    Label2: TLabel;
    dblcArtigo: TwwDBLookupCombo;
    cdsArtigo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbrgTipoObjetoChange(Sender: TObject);
  private
    { Private declarations }
    CtrlProdServ : TCtrlProdServ;
  public
    { Public declarations }
  end;

var
  frmCadProdServ: TfrmCadProdServ;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadProdServ.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlProdServ:=TCtrlProdServ.Create;
   CtrlProdServ.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlProdServ.CdsObjeto:=Cds;
   Cds.Data:=CtrlProdServ.ListProdServ(Sistema.IdEmpresa,-1); //vazio
   MontaSelect.Filtro.Add('IDPESSOA = '+FloatToStr(Sistema.IdEmpresa));
end;

procedure TfrmCadProdServ.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   CtrlProdServ.Free;
end;

procedure TfrmCadProdServ.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   Cds.FieldByName('TIPOOBJETO').AsString:='S';
   Cds.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
end;

procedure TfrmCadProdServ.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       Cds.Close;
       Cds.Data:=CtrlProdServ.ListProdServ(Sistema.IdEmpresa,StrToFloat(MontaSelect.ValoresChave[0]));
    end;
end;

procedure TfrmCadProdServ.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   if (Trim(dbmemNomeServ.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o nome do Serviço/Produto','Atenção',mtWarning,[mbOk],0);
       dbmemNomeServ.SetFocus;
       Abort;
    end;

   if (dbrgTipoObjeto.ItemIndex=1) and (Trim(dblcArtigo.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o Artigo para Serviço/Produto do tipo Mercadoria',
              'Atenção',mtWarning,[mbOk],0);
       dblcArtigo.SetFocus;
       Abort;
    end;

   inherited;
end;

procedure TfrmCadProdServ.CmeCadastroConfirma(Sender: TObject);
begin
   if not(CtrlProdServ.AplicaAtualObjeto) then
    begin
       MsgDlg(CtrlProdServ.MessageInfo,'Erro',mtError,[mbOK],0);
       Abort;
    end
   else
    inherited;
end;

procedure TfrmCadProdServ.dbrgTipoObjetoChange(Sender: TObject);
begin
   dblcArtigo.Enabled:=(dbrgTipoObjeto.ItemIndex=1);
end;

end.
