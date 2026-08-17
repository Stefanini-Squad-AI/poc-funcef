unit FMTAtualizaMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBClient, uCMClientDataSet, StdCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, CMDBLookupCombo, ComCtrls,
  uCtrlAtualizaMovimento, uCtrlMovEstoque, uCtrlArtigo, uCmSqlParams;

type
  TFrmMTAtualizaMov = class(TfrmSairAjuda)
    Panel1: TPanel;
    Memo1: TMemo;
    cdsArtigo: TCMClientDataSet;
    Label2: TLabel;
    plnAni: TPanel;
    Label1: TLabel;
    Ani: TAnimate;
    LbArtigo: TLabel;
    dblcArt: TCMDBLookupCombo;
    edDataI: TCMDateTimePicker;
    BtnAtualiza: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure edDataIExit(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
  private
    { Private declarations }
    AtualizaMovimento : TCtrlAtualizaMovimento;
    MovEstoque        : TCtrlMovEstoque;
    Artigo            : TCtrlArtigo;
  public
    { Public declarations }
  end;

var
  FrmMTAtualizaMov: TFrmMTAtualizaMov;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uModulo, DBaseDados,uAutorizacao;

procedure TFrmMTAtualizaMov.FormCreate(Sender: TObject);
begin
  inherited;
  AtualizaMovimento := TCtrlAtualizaMovimento.Create;
  AtualizaMovimento.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  MovEstoque := TCtrlMovEstoque.Create;
  MovEstoque.InitializeAs(AtualizaMovimento);

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs(AtualizaMovimento);

  cdsArtigo.Data := Artigo.ListArtigo;
  
  edDataI.Date := Date;

end;

procedure TFrmMTAtualizaMov.edDataIExit(Sender: TObject);
begin
  inherited;
 If edDataI.Date <  MovEstoque.GetDataImplantacao(Sistema.IdEmpresa)+ 1  Then
     Begin
       MsgDlg('Data não pode ser menor que a data de implatação','Erro',mtError,[MbOk],0);
       edDataI.SetFocus;
     End
end;

procedure TFrmMTAtualizaMov.BtnAtualizaClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcArt.Text) = '' Then
       Begin
         MsgDlg('Artigo não selecionado','Erro',mtError,[MbOk],0);
         dblcArt.SetFocus;
       End
    Else
    If Trim(edDataI.Text) = '' Then
       Begin
         MsgDlg('Data não preenchida','Erro',mtError,[MbOk],0);
         edDataI.SetFocus;
       End
    Else
       Begin
          BtnAtualiza.Enabled := False;
          Try

             plnAni.Visible := True;
             Ani.Active     := True;
             Application.ProcessMessages;

             If Not AtualizaMovimento.Atualizar( Sistema.IdEmpresa,
                                                 dblcArt.LookupValue,
                                                 (edDataI.Date-1),
                                                 (Modulo.sIntegraContab = 'S') )
             Then
                MsgDlg(AtualizaMovimento.MessageInfo,'Erro',mtError,[MbOk],0)
             Else
                MsgDlg('Atualização realizada com sucesso','Informação',mtInformation,[MbOk],0);

          Finally
             Ani.Active     := False;
             plnAni.Visible := False;
             BtnAtualiza.Enabled := True;
          End;
       End;
end;

end.
