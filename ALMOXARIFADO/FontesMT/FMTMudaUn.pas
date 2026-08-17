unit FMTMudaUn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Mask, DBCtrls, wwdblook,
  CMDBLookupCombo, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  uCtrlArtigo, uCtrlUnMedida, uCtrlMudaUnid;

type
  TFrmMTMudaUn = class(TfrmSairAjuda)
    Panel1: TPanel;
    Memo1: TMemo;
    BtnAtualiza: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    LbArtigo: TLabel;
    Label1: TLabel;
    edUnCusto: TDBEdit;
    Label15: TLabel;
    dblcUnidMedida: TwwDBLookupCombo;
    cdsArtigo: TCMClientDataSet;
    cdsUnMedida: TCMClientDataSet;
    dsArtigo: TwwDataSource;
    plnStatus: TPanel;
    pgbar: TProgressBar;
    dblcArt: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure dblcArtCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Artigo   : TCtrlArtigo;
    UnMedida : TCtrlUnMedida;
    MudaUnid : TCtrlMudaUnid;

    Procedure Progresso(Args : Array of Variant );
  public
    { Public declarations }
  end;

var
  FrmMTMudaUn: TFrmMTMudaUn;

implementation

{$R *.DFM}

uses uSistema, DBaseDados, uModulo, uMensErro;

procedure TFrmMTMudaUn.FormCreate(Sender: TObject);
begin
  inherited;
  MudaUnid := TCtrlMudaUnid.Create;
  MudaUnid.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  MudaUnid.Progresso := Progresso;

  Artigo   := TCtrlArtigo.Create;
  Artigo.InitializeAs(MudaUnid);

  UnMedida := TCtrlUnMedida.Create;
  UnMedida.InitializeAs(MudaUnid);

  cdsArtigo.Data := Artigo.ListArtigo;

  cdsUnMedida.Data := UnMedida.ListUnMedida;

end;

procedure TFrmMTMudaUn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Artigo.Free;
  UnMedida.Free;
  MudaUnid.Free;

end;

procedure TFrmMTMudaUn.BtnAtualizaClick(Sender: TObject);
begin
  inherited;
    If Trim(dblcArt.Text) = '' Then
    Begin
     MsgDlg('Artigo não preenchido','Erro',mtError,[mbOK],0);
     dblcArt.SetFocus;
    End
  Else
  If Trim(dblcUnidMedida.Text) = '' Then
    Begin
     MsgDlg('Artigo não preenchido','Erro',mtError,[mbOK],0);
     dblcUnidMedida.SetFocus;
    End
  Else
  If Trim(dblcUnidMedida.Text) = Trim(edUnCusto.Text) Then
    Begin
     MsgDlg('Não pode alterar para a mesma unidade','Erro',mtError,[mbOK],0);
     dblcUnidMedida.SetFocus;
    End
  Else
     Begin
        plnStatus.Visible := True;

        MudaUnid.CreateThreadProgresso;

        If Not MudaUnid.ConverterUnidade(CdsArtigo.FieldByName('CODARTIGO').AsString,
                                         CdsArtigo.FieldByName('CODPRODUTO').AsString,
                                         CdsArtigo.FieldByName('CODMEDCUSTO').AsString,
                                         dblcUnidMedida.LookupValue,
                                         MudaUnid.ProgressFileName )
        Then
           Begin
              MudaUnid.FreeThreadProgresso;
              MsgDlg(MudaUnid.MessageInfo,'Erro',mtError,[mbOk],0)
           End
        Else
           Begin
              MudaUnid.FreeThreadProgresso;
              MsgDlg(MudaUnid.MessageInfo,'Informação',mtInformation,[mbOk],0);
           End;
        plnStatus.Visible := False;
     End;
end;

procedure TFrmMTMudaUn.Progresso(Args: array of Variant);
begin
   pgBar.Max         := Args[1];
   pgBar.Position    := Args[2];
   plnStatus.Caption := Args[3];

   Self.Repaint;
end;

procedure TFrmMTMudaUn.dblcArtCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
     cdsUnMedida.Data := UnMedida.ListUnMedida(cdsArtigo.FieldByName('CODPRODUTO').AsString); 
end;

end.
