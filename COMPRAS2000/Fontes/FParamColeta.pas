unit FParamColeta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery, Mask;

type
  TFrmParamColeta = class(TfrmOkCancelar)
    qryProc: TwwQuery;
    qryProcCODPROCESSO: TFloatField;
    Label1: TLabel;
    dblcProc: TCMDBLookupCombo;
    Label2: TLabel;
    memCabec: TMemo;
    Label3: TLabel;
    memRodape: TMemo;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EdAssinat1: TEdit;
    EdAssinat2: TEdit;
    EdAssinat3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
    Procedure GravaParam( s1 , s2 :String );
  public
    { Public declarations }
  end;

var
  FrmParamColeta: TFrmParamColeta;

implementation

{$R *.DFM}

Uses DRelCompras, DCompras, uSistema, uMensErro,
     uDataBase, dBaseDados, uModulo;

procedure TFrmParamColeta.FormCreate(Sender: TObject);
begin
  inherited;
  qryProc.Close;
  qryProc.Params[0].AsInteger := Sistema.IdUsuario;
  qryProc.Open;
  //
  FazQuery(DtmBaseDados.qry,'SELECT CABECCOLETA,RODAPECOLETA FROM PARAMCOMPRAS WHERE (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')');

  If Not DtmBaseDados.qry.FieldByName('CABECCOLETA').IsNull Then
      memCabec.lines.text := DtmBaseDados.qry.FieldByName('CABECCOLETA').AsString
  Else
      memCabec.lines.text := 'Solicitamos fornecer o(s) preço(s) Material(is)/Serviço(s) abaixo discriminado(s), devolvendo no dia '+DateToStr(Date+2)+
                             ' a primeira via deste impresso, datado, assinado e carimbado no espaço reservado, sem rasuras. ';

  If Not DtmBaseDados.qry.FieldByName('RODAPECOLETA').IsNull Then
     memRodape.lines.text := DtmBaseDados.qry.FieldByName('RODAPECOLETA').AsString
  Else
     memRodape.lines.text := 'Atenção: Caso não haja manifestação de V.Sª sobre as condições gerais, fica desde já entendido que as condições pretendidas foram aceitas integralmente.'+ #13 +
                             'Está coleta de preço deverá ser entregue na sala 702, em envelope fechado.';
  //
  edAssinat1.Text := Modulo.sAssinatura1;
  edAssinat2.Text := Modulo.sAssinatura2;
  edAssinat3.Text := Modulo.sAssinatura3;
  //
end;

Procedure TFrmParamColeta.FazRel;
Begin
    DtmCompras.qryEndCobEnt.Close;
    DtmCompras.qryEndCobEnt.Params[0].AsInteger := Sistema.IdEmpresa;
    DtmCompras.qryEndCobEnt.Open;
    //
    DtmRelCompras.qryImagens.Close;
    DtmRelCompras.qryImagens.Params[0].AsInteger := DtmCompras.qryEndCobEntIDIMAGEM.AsInteger;
    DtmRelCompras.qryImagens.Open;
    //
    DtmRelCompras.memCabec.Lines.Clear;
    DtmRelCompras.memRodape.Lines.Clear;
    DtmRelCompras.memCabec.Lines.Text  := memCabec.Lines.Text;
    DtmRelCompras.memRodape.Lines.Text := memRodape.Lines.Text;
    //
    If DtmCompras.qryEndCobEntMASCARA.IsNull Then
       DtmRelCompras.LbNumDoc.Caption  := DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString
    Else
       DtmRelCompras.LbNumDoc.Caption  := FormatMaskText( Trim(DtmCompras.qryEndCobEntMASCARA.AsString) + ';0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);

    DtmRelCompras.LbNumDoc.Caption        := DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString;

    DtmRelCompras.LbEndColeta.Caption     := Trim(DtmCompras.qryEndCobEntENDENT.AsString) +' Nº '+Trim(DtmCompras.qryEndCobEntNUMENT.AsString);
    DtmRelCompras.LbEndColeta2.Caption    := Trim(DtmCompras.qryEndCobEntENDENT.AsString) +' Nº '+Trim(DtmCompras.qryEndCobEntNUMENT.AsString);    
    DtmRelCompras.LbCidadeColeta.Caption  := DtmCompras.qryEndCobEntCIDADEENT.AsString;
    DtmRelCompras.LbCidadeColeta2.Caption := DtmCompras.qryEndCobEntCIDADEENT.AsString;
    DtmRelCompras.LbDDDColeta.Caption     := '('+DtmCompras.qryEndCobEntDDDENT.AsString+')';
    DtmRelCompras.LbDDDFaxColeta.Caption  := '('+DtmCompras.qryEndCobEntDDDFAXENT.AsString+')';
    If Length(Trim(DtmCompras.qryEndCobEntTELENT.AsString)) <= 7 Then
       DtmRelCompras.LbTelColeta.Caption := FormatMaskText('000-0000;0;',DtmCompras.qryEndCobEntTELENT.AsString)
    Else
       DtmRelCompras.LbTelColeta.Caption := FormatMaskText('0000-0000;0;',DtmCompras.qryEndCobEntTELENT.AsString);
    If Length(Trim(DtmCompras.qryEndCobEntFAXENT.AsString)) <= 7 Then
       DtmRelCompras.LbFaxColeta.Caption := FormatMaskText('000-0000;0;',DtmCompras.qryEndCobEntFAXENT.AsString)
    Else
       DtmRelCompras.LbFaxColeta.Caption := FormatMaskText('0000-0000;0;',DtmCompras.qryEndCobEntFAXENT.AsString);    
    //
    DtmRelCompras.LbColetaAssinat1.Caption := edAssinat1.Text;
    DtmRelCompras.LbColetaAssinat2.Caption := edAssinat2.Text;
    DtmRelCompras.LbColetaAssinat3.Caption := edAssinat3.Text;
    //
    With DtmRelCompras.qryColeta Do
       Begin
           Close;
           Params[0].AsFloat := StrToFloat(dblcProc.LookupValue);
           Open;
       End;
    GravaParam(memCabec.Lines.Text,memRodape.Lines.Text );
End;
Procedure TFrmParamColeta.GravaParam( s1 , s2 :String );
Begin
   If Trim(s1) = '' Then s1 := 'Null';
   If Trim(s2) = '' Then s2 := 'Null';
   Try
      StartTransacao;
      If Not ExecutarQuery(DtmBaseDados.qry,' UPDATE PARAMCOMPRAS SET CABECCOLETA = '+QuotedStr(Trim(S1))+' , RODAPECOLETA = '+QuotedStr(Trim(S2))+
                                            ' WHERE (IDPESSOA ='+IntToStr(Sistema.IdEmpresa)+')')
      Then
         Abort;
      CommitTransacao;
   Except
      RollBackTransacao;
   End;

End;
procedure TFrmParamColeta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcProc.Text) = '' Then
     Begin
        ModalResult := mrNone;
        MsgDlg('Preencha o número do processo','Erro',mtError,[mbOK],0);
        dblcProc.SetFocus;
     End
  Else
     Begin
        ModalResult := mrOK;
        FazRel; 
     End;
  
end;

End.

