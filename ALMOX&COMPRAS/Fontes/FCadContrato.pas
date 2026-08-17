unit FCadContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, CMProcuraSubTipo, Spin, TREdit, Mask,
  wwdblook,uCMTypes, CMDBLookupCombo, Grids, DBGrids, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TFrmCadContrato = class(TfrmCadastroCS)
    qryIDCONTRATOPROD: TFloatField;
    qryCODARTIGO: TStringField;
    qryCODMEDIDA: TStringField;
    qryIDFORCLI: TFloatField;
    qryIDPESSOA: TFloatField;
    qryVLRUNITARIO: TFloatField;
    qryPRAZOPAG: TFloatField;
    qryDATAINICIO: TDateTimeField;
    qryDATATERMINO: TDateTimeField;
    qryQTDEESPERADA: TFloatField;
    cmpForn: TCMProcuraForCli;
    spPrazoPag: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    GrpData: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    qryArtigo: TwwQuery;
    qryUnidMed: TwwQuery;
    qryUnidMedCODMEDIDA: TStringField;
    qryUnidMedDESCMEDIDA: TStringField;
    GrpArt: TGroupBox;
    Label3: TLabel;
    edQtdeEsp: TDBRealEdit;
    Label7: TLabel;
    dblcItem: TwwDBLookupCombo;
    Label6: TLabel;
    dblcDesc: TwwDBLookupCombo;
    Label8: TLabel;
    dblcUN: TwwDBLookupCombo;
    Label9: TLabel;
    edVlrUnitario: TDBRealEdit;
    dblcComrpador: TCMDBLookupCombo;
    Label10: TLabel;
    qryComprador: TwwQuery;
    qryCompradorIDPESSOA: TFloatField;
    qryIDCOMPRADOR: TFloatField;
    qryCompradorNOME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel( n : Double );
    Procedure SelUnid( S : String );
  public
    { Public declarations }
  end;

var
  FrmCadContrato: TFrmCadContrato;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, uDataBase;

procedure TFrmCadContrato.Sel( n : Double );
Begin
    qry.Close;
    qry.Params[0].asFloat := n;
    qry.Open;
End;
procedure TFrmCadContrato.FormCreate(Sender: TObject);
begin
  inherited;
  Sel( -1 );
end;

procedure TFrmCadContrato.CmeCadastroInsert(Sender: TObject);
begin
     Inherited;
     qryDataInicio.AsDateTime  := Date;
     qryDataTermino.AsDateTime := Date;
     cmpForn.SetFocus;
end;

procedure TFrmCadContrato.CmeCadastroEdit(Sender: TObject);
begin
     Inherited;
     cmpForn.SetFocus;
end;

procedure TFrmCadContrato.CmeCadastroFind(Sender: TObject);
begin
   Inherited;
   If MontaSelect.RetornouValor Then
    Begin
        Sel(StrToFloat(MontaSelect.ValoresChave[0]));
        spPrazoPag.Value := qryPrazoPag.asInteger; 
    End;
end;

Procedure TFrmCadContrato.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    If cmpForn.Valida <> vcOk Then
       Begin
          cmpForn.SetFocus;
          Accept := False;
       End
    Else
    If Trim(dblcComrpador.Text) = ''  Then
       Begin
          MsgDlg('Comprador não preenchido','Erro',mtError,[mbOK],0);
          dblcComrpador.SetFocus;
          Accept := False;
       End
    Else
    If edDataFim.Date < edDataIni.Date  Then
       Begin
          MsgDlg('Data de Término não pode ser menor que a Data de Início','Erro',mtError,[mbOK],0);
          edDataFim.SetFocus;
          Accept := False;
       End
    Else
    If Trim(dblcItem.Text) = ''  Then
       Begin
          MsgDlg('Artigo não preenchido','Erro',mtError,[mbOK],0);
          dblcItem.SetFocus;
          Accept := False;
       End
    Else
    If Trim(dblcUN.Text) = ''  Then
       Begin
          MsgDlg('Unidade de medida não preenchido','Erro',mtError,[mbOK],0);
          dblcUN.SetFocus;
          Accept := False;
       End
    Else
    If edVlrUnitario.Value = 0  Then
       Begin
          MsgDlg('Valor unitário não pode ser zero','Erro',mtError,[mbOK],0);
          edVlrUnitario.SetFocus;
          Accept := False;
       End;
End;

Procedure TFrmCadContrato.CmeCadastroConfirma(Sender: TObject);
Begin
    If qry.State in [dsInsert,dsEdit] Then
       Begin
          If qry.State = dsInsert Then
             qryIdContratoProd.AsFloat := LeUltRegistro(nil,'CONTRATOPROD');
          qryIdPessoa.asInteger := Sistema.IdEmpresa;
          qryPrazoPag.asInteger := spPrazoPag.Value;
       End;
    inherited;
End;

Procedure TFrmCadContrato.SelUnid( S : String );
Begin
    qryUnidMed.Close;
    qryUnidMed.Params[0].asString := Copy(s,1,6);
    qryUnidMed.Open;
End;
procedure TFrmCadContrato.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
       dblcItem.LookUpValue := dblcDesc.LookUpValue;
       SelUnid(dblcItem.LookUpValue );
    End;
end;

procedure TFrmCadContrato.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
     Begin
        dblcItem.LookUpValue := dblcDesc.LookUpValue;
        dblcDesc.LookUpValue := dblcItem.LookUpValue;
        SelUnid(dblcDesc.LookUpValue );
     End;
end;

end.
