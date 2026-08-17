unit FMTAlteraCustoMed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Mask, DBCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, MontaSelect, uCtrlAlteraCustoMed,
  uCtrlUnidNegocio, Db, DBClient, uCMClientDataSet, Wwdatsrc, ComCtrls;

type
  TFrmMTAlteraCustoMed = class(TfrmSairAjuda)
    Label1: TLabel;
    lbALmox: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edUnCusteio: TEdit;
    edAlmox: TEdit;
    edNumReq: TRealEdit;
    dblcAtiv: TwwDBLookupCombo;
    GrpArt: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdArtigo: TDBEdit;
    edDesc: TDBEdit;
    edUnid: TDBEdit;
    edCustoMed: TDBRealEdit;
    edSaldoUC: TDBRealEdit;
    edValor: TDBRealEdit;
    MontaSelect: TMontaSelect;
    BtnAltCM: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    cds: TCMClientDataSet;
    cdsUnidNegoc: TCMClientDataSet;
    ds: TwwDataSource;
    btnProcurar: TBitBtn;
    edData: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnAltCMClick(Sender: TObject);
    procedure edCustoMedExit(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    AlteraCustoMed : TCtrlAlteraCustoMed;
    UnidNegocio    : TCtrlUnidNegocio;
    //
    Procedure Sel( CodCusteio : Integer; CodArtigo : String );

  public
    { Public declarations }
  end;

var
  FrmMTAlteraCustoMed: TFrmMTAlteraCustoMed;

implementation

{$R *.DFM}

Uses uSistema, uModulo, uMensErro, DBaseDados;

procedure TFrmMTAlteraCustoMed.FormCreate(Sender: TObject);
begin
  inherited;
  AlteraCustoMed := TCtrlAlteraCustoMed.Create;
  AlteraCustoMed.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  cdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);

  Sel(0,'');

  edUnCusteio.Text := cds.FieldByName('DESCCUSTEIO').asString;
  edAlmox.Text     := Modulo.sAlmoxaUsuario;

  If Modulo.LeDataRepresa > Date Then
     edData.Text := DateTimeToStr(Date)
  Else
     edData.Text := DateTimeToStr(Modulo.LeDataRepresa);

  MontaSelect.Filtro.Add(' CUSTOMED.CODCUSTEIO = ' + IntToStr(Modulo.iCodCusteio));
  //

end;

procedure TFrmMTAlteraCustoMed.Sel(CodCusteio: Integer; CodArtigo: String);
begin
  cds.Data := AlteraCustoMed.ListAltCustoMed(CodCusteio,CodArtigo);
  edUnCusteio.Text := cds.FieldByName('DESCCUSTEIO').asString;
end;

procedure TFrmMTAlteraCustoMed.BtnAltCMClick(Sender: TObject);
Var
   rVal : Double;
begin
  inherited;
  rVal := AlteraCustoMed.ConverteValor(edValor.Value,Modulo.iCodCusteio,cds.FieldByName('CODARTIGO').AsString);
  If rVal = 0 Then
    Begin
       MsgDlg('Artigo não possui saldo','Erro',mtError,[mbOk],0);
    End
  Else
  If EdNumReq.Value = 0 Then
    begin
        MsgDlg('Número da requisição não preenchido','Erro',mtError,[mbOk],0);
        edNumReq.SetFocus;
    End
  Else
  If (trim(dblcAtiv.Text) = '') Then
     Begin
        MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
     End
  Else
    Begin
      If AlteraCustoMed.AlteraCusto(Sistema.IdEmpresa,
                                    rVal,
                                    Modulo.iCodCusteio,
                                    Modulo.iCodAlmoxa,
                                    cds.FieldByName('CODARTIGO').AsString,
                                    cds.FieldByName('CODMEDCUSTO').AsString,
                                    StrToDateTime(edData.Text),
                                    edNumReq.Text,
                                    Modulo.sCCustoAlmoxa,
                                    StrToIntDef(dblcAtiv.LookupValue,0) )
      Then
         MsgDlg('O custo médio foi alterado com sucesso','Informação',mtInformation,[mbOk],0)
      Else
         MsgDlg(AlteraCustoMed.MessageInfo,'Erro',mtError,[mbOk],0);

      Sel(0,'');  
    End;
end;

procedure TFrmMTAlteraCustoMed.edCustoMedExit(Sender: TObject);
begin
  inherited;
  cds.Edit;
  edValor.Value := edCustoMed.Value * edSaldoUC.Value;
  cds.Post;
end;

procedure TFrmMTAlteraCustoMed.btnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then
    begin
       Sel(Modulo.iCodCusteio,MontaSelect.ValoresChave[0]);
       edCustoMed.SetFocus;
    End;
end;

end.
