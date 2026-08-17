unit FMTAltValidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwmonthcalendar, DBCtrls,uCtrlAlteraValidade, Grids, Wwdbigrd, Wwdbgrid,
  uCMTypes;

type
  TFrmMTAltValidade = class(TFrmCadastroMT)
    calendario: TwwDBMonthCalendar;
    Label1: TLabel;
    Label2: TLabel;
    DBText2: TDBText;
    DBText1: TDBText;
    dbGrd: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    AlteraValidade : TCtrlAlteraValidade;
    Procedure Sel( n : Double );
  public
    { Public declarations }
  end;

var
  FrmMTAltValidade: TFrmMTAltValidade;

implementation

{$R *.DFM}

uses uSistema, DBaseDados, uModulo, uMensErro;

procedure TFrmMTAltValidade.FormCreate(Sender: TObject);
begin
  inherited;
  AlteraValidade := TCtrlAlteraValidade.Create;
  AlteraValidade.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  MontaSelect.Filtro.Add('NFRECEBDEVOL.IDPESSOA = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('NFRECEBDEVOL.FLGTIPONOTA = ''R''');

  Sel(-1);
end;

procedure TFrmMTAltValidade.Sel(n: Double);
begin
   Cds.Data := AlteraValidade.Procurar( n );
end;

procedure TFrmMTAltValidade.FormShow(Sender: TObject);
begin
  inherited;
  dbGrd.BringToFront;
end;

procedure TFrmMTAltValidade.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmMTAltValidade.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbGrd.SendToBack;
  Calendario.Date := Cds.FieldByName('DATAVALIDADE').AsDateTime;
end;

procedure TFrmMTAltValidade.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dbGrd.BringToFront;
end;

procedure TFrmMTAltValidade.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dbGrd.BringToFront;
end;

procedure TFrmMTAltValidade.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := AlteraValidade.Alterar( Sistema.IdEmpresa,
                                    Cds.FieldByName('IDITENSRECDEV').AsFloat,
                                    Cds.FieldByName('CODALMOXARIFADO').AsInteger,
                                    Cds.FieldByName('CODARTIGO').AsString,
                                    Cds.FieldByName('CODMEDIDA').AsString,
                                    Cds.FieldByName('DATAVALIDADE').AsDateTime,
                                    calendario.Date,
                                    Cds.FieldByName('QTDERECEBDEVOL').AsFloat );
end;

procedure TFrmMTAltValidade.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( AlteraValidade.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmMTAltValidade.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Sel(Cds.FieldByName('IDNFRECEBDEVOL').AsFloat);
end;

end.
