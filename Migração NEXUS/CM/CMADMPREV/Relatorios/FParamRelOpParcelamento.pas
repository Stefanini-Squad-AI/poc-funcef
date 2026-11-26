unit FParamRelOpParcelamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, MontaSelect, TREdit,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmParamRelOpParcelamento = class(TfrmOkCancelar)
    qryopcoes: TwwQuery;
    qryopcoesFLGSELECIONADO: TFloatField;
    qryopcoesNMESES: TStringField;
    qryopcoesPERCENTUAL: TStringField;
    qryopcoesVALOR: TStringField;
    Panel7: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    dbSdoDevedor: TDBRealEdit;
    DBRealEdit4: TDBRealEdit;
    DBRealEdit5: TDBRealEdit;
    rdbNumarcelas: TDBRealEdit;
    edsitparcelamento: TEdit;
    DBRealEdit1: TDBRealEdit;
    MontaSelectPart: TMontaSelect;
    sbtnProcParticip: TSpeedButton;
    dsparcelamento: TwwDataSource;
    qryParcelamento: TwwQuery;
    GroupBox1: TGroupBox;
    grdOpcoes: TwwDBGrid;
    dsOpcoes: TwwDataSource;
    UpdOpcoes: TUpdateSQL;
    procedure sbtnProcParticipClick(Sender: TObject);
    procedure qryParcelamentoAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     lIdPessoa, lIdPessJur, lIdPlanoPrev, liSeqProposta : longint;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmParamRelOpParcelamento: TfrmParamRelOpParcelamento;

implementation

uses DRelatorios, USistema, UFuncoesUteis, UAdmPrev, UMensErro;

{$R *.DFM}

procedure TfrmParamRelOpParcelamento.sbtnProcParticipClick(
  Sender: TObject);

begin
  inherited;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     lIdPessoa    := StrToInt(MontaSelectPart.ValoresChave[0]);
     lIdPessJur   := StrToInt(MontaSelectPart.ValoresChave[1]);
     lIdPlanoPrev := StrToInt(MontaSelectPart.ValoresChave[2]);
     liSeqProposta := StrToInt(MontaSelectPart.ValoresChave[16]);
  end
  else begin
     lIdPessoa := -1;
     lIdPessJur := -1;
     lIdPlanoPrev := -1;
     liSeqProposta := -2;
  end;


  qryParcelamento.Close;
  qryopcoes.close;  
  edsitparcelamento.text := '';

  if lIdPessoa <= 0 then exit;


  qryParcelamento.ParamByName('IdPessoa').AsInteger    := lIdPessoa;
  qryParcelamento.ParamByName('IdPessJur').AsInteger   := lIdPessJur;
  qryParcelamento.ParamByName('IdPlanoPrev').AsInteger := lIdPlanoPrev;
  qryParcelamento.Open;

  qryopcoes.ParamByName('IDCALCULO').AsInteger := qryparcelamento.fieldbyname('IDCALCULOREGRA').AsInteger;
  qryopcoes.open;
end;




procedure TfrmParamRelOpParcelamento.qryParcelamentoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
   if qryparcelamento.isempty then exit;

   if qryparcelamento.fieldbyname('SITPARCELAMENTO').AsInteger = 1 then
   begin
      edsitparcelamento.text := 'Normal';
   end
   else
   begin
      case qryparcelamento.fieldbyname('SITPARCELAMENTO').AsInteger  of
         2: edsitparcelamento.text := 'Quitado';
         3: edsitparcelamento.text := 'Quitado por morte';
         4: edsitparcelamento.text := 'Quitado por invalidez';
         5: edsitparcelamento.text := 'Cancelado';
         6: edsitparcelamento.text := 'Refinanciado';
      end;

   end;
end;

procedure TfrmParamRelOpParcelamento.bbtnConfirmarClick(Sender: TObject);
var sDescOpcoes : TStringList;
    sAux : String;
    nOpcoes : Integer;
begin
  inherited;
   if qryparcelamento.isempty then
   begin
      MsgDlg('Nenhum parcelamento foi selecionado.','Erro',mtError,[mbOk],0);
      Exit;
   end;


   nOpcoes := 0;

   sDescOpcoes := TStringList.Create;


   sDescOpcoes.Add('N. de meses     Perc. Salário      Vlr. Prim. Prestação     Seguro');

   sDescOpcoes.Add('__________________________________________________________________');


   while not qryopcoes.eof do
   begin
      if qryopcoes.FieldByName('FlgSelecionado').AsInteger = 1 then
      begin
         inc(nopcoes);
         sDescOpcoes.Add(CompletaString(qryopcoes.FieldByName('NMESES').AsString,' ',11,False)+
                         CompletaString(qryopcoes.FieldByName('PERCENTUAL').AsString,' ',18,False)+
                         CompletaString(FormatFloat('#0.00',strtofloat(clientenumero(qryopcoes.FieldByName('VALOR').AsString))),' ',26,False)+''+
                         CompletaString(FormatFloat('#0.00',strtofloat(clientenumero(qryopcoes.FieldByName('SEGURO').AsString))),' ',10,False));
      end;

      qryopcoes.next;
   end;


   if nOpcoes = 0 then
   begin
      MsgDlg('É preciso selecionar pelo menos uma das opções.','Erro de operação',mtInformation,[mbOk],0);
      Exit;
   end;

   dtmRelatorios.qryFundacao.Close;
   dtmRelatorios.qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
   dtmRelatorios.qryFundacao.Open;


   dtmRelatorios.QryParcelamento.close;
   dtmRelatorios.QryParcelamento.ParamByName('IdPessoa').Value := lIdPessoa;
   dtmRelatorios.QryParcelamento.ParamByName('IdPessJur').Value := lIdPessJur;
   dtmRelatorios.QryParcelamento.ParamByName('IdPlanoPrev').Value := lIdPlanoPrev;
   dtmRelatorios.QryParcelamento.ParamByName('SeqProposta').Value := liSeqProposta;
   dtmRelatorios.QryParcelamento.ParamByName('ValorDivida').Value := qryparcelamento.fieldbyname('SDODEVEDOR').AsFloat;

   dtmRelatorios.sOpcoes := TStringList.Create;
   dtmRelatorios.sOpcoes.Text := sDescOpcoes.Text  ;

   sDescOpcoes.free;

end;

procedure TfrmParamRelOpParcelamento.FormCreate(Sender: TObject);
begin
  inherited;

  sbtnProcParticipClick(self);
end;

end.
