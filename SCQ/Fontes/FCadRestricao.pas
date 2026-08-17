unit FCadRestricao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, CMProcuraSubTipo, DBCtrls, wwdblook, uCmTypes,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TFrmCadRestricao = class(TfrmCadastroCS)
    qryIDRESTRICAO: TFloatField;
    qryIDFORCLI: TFloatField;
    qryIDPESSOA: TFloatField;
    qryCODARTIGO: TStringField;
    qryDATAINI: TDateTimeField;
    qryDATAFIM: TDateTimeField;
    qryFLGFLEXIVEL: TStringField;
    qryMOTIVO: TStringField;
    cmpForn: TCMProcuraForCli;
    RgFlexivel: TDBRadioGroup;
    qryArtigo: TwwQuery;
    GroupBox2: TGroupBox;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    dblcDesc: TwwDBLookupCombo;
    edMotivo: TDBMemo;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel( n : Double );
  public
    { Public declarations }
  end;

var
  FrmCadRestricao: TFrmCadRestricao;

implementation

{$R *.DFM}
uses uDataBase, uMensErro, uSistema ;

procedure TFrmCadRestricao.Sel( n : Double );
Begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;
End;

procedure TFrmCadRestricao.CmeCadastroInsert(Sender: TObject);
begin
     Inherited;
     qry.FieldByName('FLGFLEXIVEL').AsString := 'S';
     cmpForn.SetFocus;
end;

procedure TFrmCadRestricao.CmeCadastroEdit(Sender: TObject);
begin
     Inherited;
     cmpForn.SetFocus;
end;

procedure TFrmCadRestricao.CmeCadastroFind(Sender: TObject);
begin
     Inherited;
     If MontaSelect.RetornouValor Then
      Begin
          Sel(StrToFloat(MontaSelect.ValoresChave[0]));
      End;
end;

Procedure TFrmCadRestricao.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    If cmpForn.Valida <> vcOK then
      Begin
         cmpForn.SetFocus;
         Accept := False;
      end
    Else
    If Trim(edMotivo.text) = '' Then
      Begin
         MsgDlg('Obrigatório Preencher o Motivo','Erro',mtError,[mbOK],0);
         edMotivo.SetFocus;
         Accept := False;
      end;
End;

procedure TFrmCadRestricao.CmeCadastroConfirma(Sender: TObject);
begin
   If qry.State in [dsInsert,dsEdit] Then
     Begin
          If qry.State = dsInsert Then
              qry.FieldByName('IDRESTRICAO').asFloat := LeUltRegistro(nil,'RESTRICAO');
          qry.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa ;
     End;
   Inherited;
end;


procedure TFrmCadRestricao.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('RESTRICAO.IDPESSOA ='+IntToStr(Sistema.IdEmpresa));
  Sel(-1);
end;

end.
