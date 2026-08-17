// -----------------------------------------------------------------------------
// Pendência : 17345
// Autor     : Daniel Simões
// Data      : 26/04/2006
// Descrição : Retirado os campos "Ligado a Atividade" ...
// -----------------------------------------------------------------------------

unit FCadItemContratualMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  uCtrlItemContratual;

type
  TfrmCadItemContratualMT = class(TFrmCadastroMT)
    Label1: TLabel;
    dbmemItem: TDBMemo;
    dbrgTipoCobranca: TDBRadioGroup;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    CtrlItemContratual : TCtrlItemContratual;
  public
    { Public declarations }
  end;

var
  frmCadItemContratualMT: TfrmCadItemContratualMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadItemContratualMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlItemContratual:=TCtrlItemContratual.Create;
   CtrlItemContratual.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlItemContratual.CdsItemContratual:=Cds;
   //Carrega cds
   Cds.Data:=CtrlItemContratual.ListItemContratual(Sistema.IdEmpresa,-1);
   MontaSelect.Filtro.Add('IDPESSOA = '+FloatToStr(Sistema.IdEmpresa));
end;

procedure TfrmCadItemContratualMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   Cds.FieldByName('TIPOCOBRANCA').AsString:='PS';
   Cds.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
end;

procedure TfrmCadItemContratualMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       Cds.Close;
       Cds.Data:=CtrlItemContratual.ListItemContratual(Sistema.IdEmpresa,
                                                       StrToFloat(MontaSelect.ValoresChave[0]));
    end;
end;

procedure TfrmCadItemContratualMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
   if (Trim(Cds.FieldByName('NOME_ITEM').AsString)='') then
    begin
       MsgDlg('Obrigatório preencher o nome do Item Contratual','Atenção',mtWarning,[mbOk],0);
       dbmemItem.SetFocus;
       Abort;
    end
   else
    inherited;
end;

procedure TfrmCadItemContratualMT.CmeCadastroConfirma(Sender: TObject);
begin
   if not(CtrlItemContratual.AplicaAtualItem) then
    begin
       MsgDlg(CtrlItemContratual.MessageInfo,'Erro',mtError,[mbOK],0);
       Abort;
    end
   else
    inherited;
end;

end.
