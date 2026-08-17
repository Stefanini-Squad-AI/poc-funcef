unit FPRelEstruturaRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmPRelEstruturaRubrica = class(TfrmOkCancelar)
    dblkEstruturaRubrica: TwwDBLookupCombo;
    qryestruturaCalcula: TwwQuery;
    dsEstruturaCalculo: TwwDataSource;
    Label1: TLabel;
    rdoSelecaoEstrutura: TRadioGroup;
    qryestruturaCalculaIDESTRUTURA: TFloatField;
    qryestruturaCalculaIDREGRA: TFloatField;
    qryestruturaCalculaIDRUBRICAEXIBICAO: TFloatField;
    qryestruturaCalculaDESCRICAO: TStringField;
    qryestruturaCalculaTRGDTINCLUSAO: TDateTimeField;
    qryestruturaCalculaTRGUSERINCLUSAO: TStringField;
    qryestruturaCalculaIDFUNDACAO: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdoSelecaoEstruturaClick(Sender: TObject);
    procedure dblkEstruturaRubricaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelEstruturaRubrica: TfrmPRelEstruturaRubrica;

implementation
Uses  dRelEstruturaRubricas,uMensErro;

{$R *.DFM}

procedure TfrmPRelEstruturaRubrica.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   If (Trim(dblkEstruturaRubrica.Text) = '') and  (rdoSelecaoEstrutura.ItemIndex = 1)  Then
  Begin
    MsgDlg('Por favor, escolha a Estrutura rubrica.', 'Informação', mtInformation, [mbOk], 0);
    dblkEstruturaRubrica.SetFocus;
  End
  else
   begin
     dtmRelEstruturaRubricas.qryEstrutura.Close;
     dtmRelEstruturaRubricas.qryEstrutura.Sql.Clear;
     dtmRelEstruturaRubricas.qryEstrutura.Sql.Add(
     ' SELECT '+
     '  EST.IDESTRUTURA, '+
     '  EST.IDREGRA, '+
     '  EST.IDRUBRICAEXIBICAO, '+
     '  EST.DESCRICAO, '+
     '  EXR.IDRUBRICA, '+
     '  EXR.GRUPOCALCULO, '+
     '  RUX.CODPROVDESC, '+
     '  REG.NOMEREGRA, '+
     ' RUE.DESCRICAO AS RUBESTRUTURA, '+
     ' RUX.DESCRICAO AS RUBESTXRUB '+
     ' FROM ESTRUTURACALCULO EST,ESTRUTURAXRUBRICA EXR,PROVDESC RUE,PROVDESC RUX,'+
     '     REGRA REG '+
     ' WHERE '+
     '    EXR.IDESTRUTURA = EST.IDESTRUTURA '+
     ' AND REG.IDREGRA = EST.IDREGRA '+
     ' AND RUE.IDPROVENTO = EST.IDRUBRICAEXIBICAO '+
     ' AND RUX.IDPROVENTO = EXR.IDRUBRICA ');


       If rdoSelecaoEstrutura.ItemIndex = 1 Then
           begin
             dtmRelEstruturaRubricas.qryEstrutura.sql.Add(' AND EST.IDESTRUTURA = :IDESTRUTURA ') ;
             dtmRelEstruturaRubricas.qryEstrutura.ParamByName('IDESTRUTURA').Asfloat :=
             qryestruturaCalculaIDESTRUTURA.AsFloat ;
           end;
      dtmRelEstruturaRubricas.qryEstrutura.sql.Add(     ' ORDER BY ' +
           '   EST.IDESTRUTURA, EXR.GRUPOCALCULO, EXR.IDRUBRICA ' );
        dtmRelEstruturaRubricas.qryFundacao.Open;
      dtmRelEstruturaRubricas.qryEstrutura.Open;
  end;
end;

procedure TfrmPRelEstruturaRubrica.FormShow(Sender: TObject);
begin
  inherited;
if qryestruturaCalcula.Active then
   qryestruturaCalcula.Close;
  qryestruturaCalcula.Open;
   dblkEstruturaRubrica.Enabled := False;
   bbtnconfirmar.Enabled := False;
end;

procedure TfrmPRelEstruturaRubrica.rdoSelecaoEstruturaClick(
  Sender: TObject);
begin
  inherited;
  if rdoSelecaoEstrutura.ItemIndex = 1 then
     begin
        dblkEstruturaRubrica.Enabled := True ;
        bbtnConfirmar.Enabled := False;
    end
  else
     begin
         dblkEstruturaRubrica.Enabled := False;
         bbtnConfirmar.Enabled := True;
     end;
end;

procedure TfrmPRelEstruturaRubrica.dblkEstruturaRubricaChange(
  Sender: TObject);
begin
  inherited;
 bbtnConfirmar.Enabled := True;
end;

end.
