unit FCadAditamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, DBCtrls, MAHlpBtn, Buttons, TB97,
  ExtCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, DBTables,
  Wwquery, Mask, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadAditamento = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    DBDataAssinatura: TCMDateTimePicker;
    DBDescricaoAditamento: TDBMemo;
    UpdateAditamento: TUpdateSQL;
    qryAditamento: TwwQuery;
    dsAditamento: TwwDataSource;
    qryAditamentoIDCONTRATO: TFloatField;
    qryAditamentoIDADITAMENTO: TFloatField;
    qryAditamentoDATAASSADITAMENTO: TDateTimeField;
    qryAditamentoDESCADITAMENTO: TMemoField;
    qryAditamentoFLGVIRTUAL: TStringField;
    qryAditamentoTRGDTINCLUSAO: TDateTimeField;
    qryAditamentoTRGUSERINCLUSAO: TStringField;
    qryAditamentoCODADITAMENTO: TStringField;
    DBCodAditamento: TDBEdit;
    Label3: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idcontrato : double;
  end;

var
  frmCadAditamento: TfrmCadAditamento;

implementation

uses uMensErro, FCadContrato, DBaseDados,uDataBase;

{$R *.DFM}

procedure TfrmCadAditamento.bbtnConfirmarClick(Sender: TObject);
begin
{ verificando se os campos foram preenchidos. }
   if qryAditamento.FieldByName('DATAASSADITAMENTO').AsString = '' then  begin
      MsgDlg('Obrigatório preencher a data da assinatura do aditamento','Atenção',mtWarning,[mbOk],0);
      DBDataAssinatura.SetFocus;
      Exit;
   end;
   if qryAditamento.FieldByName('CODADITAMENTO').AsString = '' then  begin
      MsgDlg('Obrigatório preencher o código do aditamento','Atenção',mtWarning,[mbOk],0);
      DBCodAditamento.SetFocus;
      Exit;
   end;
   if TRIM(qryAditamento.FieldByName('DESCADITAMENTO').AsString) = '' then  begin
      MsgDlg('Obrigatório preencher a descrição do aditamento','Atenção',mtWarning,[mbOk],0);
      DBDescricaoAditamento.SetFocus;
      Exit;
   end;
  { Incluindo o Código do Contrato na Tabela de Aditamento... }
   qryAditamento.FieldByName('IDCONTRATO').AsFloat := idcontrato;
  { Incluindo o próximo código do Aditamento.     }
   qryAditamento.FieldByName('IDADITAMENTO').AsFloat := LeUltRegistro(nil, 'ADITAMENTO');
   qryAditamento.ApplyUpdates;
   inherited;
   { Fechando a Tela... }
   qryAditamento.Close;
   bbtnSair.Click;
end;

procedure TfrmCadAditamento.FormShow(Sender: TObject);
begin
   inherited;
   DBDataAssinatura.SetFocus;
end;

procedure TfrmCadAditamento.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   qryAditamento.CancelUpdates;
   bbtnSairClick(sender);
end;

procedure TfrmCadAditamento.bbtnSairClick(Sender: TObject);
begin
   inherited;
   ModalResult := MrOk;
end;

end.
