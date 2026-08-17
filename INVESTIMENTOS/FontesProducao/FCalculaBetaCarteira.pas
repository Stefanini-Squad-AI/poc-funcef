//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_1
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//*****************************************************************************
unit FCalculaBetaCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  UBibliotecaInvest, UOperacaoInvest, UOperComum, Db, DBTables, wwQuery,
  dOperComum;

type
  TfrmCalculaBetaCarteira = class(TfrmOkCancelar)
    Label3: TLabel;
    dtCotacao: TCMDateTimePicker;
    ProgressBar1: TProgressBar;
    qryInsBetaCarteira: TwwQuery;
    QryCarteiras: TwwQuery;
    qryDelHistBeta: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
        function AtualizaBeta(dtCotacao:TDateTime): boolean;
  public
    { Public declarations }
  end;

var
  frmCalculaBetaCarteira: TfrmCalculaBetaCarteira;

implementation

uses dBaseDados, UMensErro, USistema, UDataBase, URendaVariavel;

{$R *.DFM}

procedure TfrmCalculaBetaCarteira.bbtnConfirmarClick(Sender: TObject);
begin
   // AL_1
   if RendaVariavel.VerEmAbertura then
      Exit;

  inherited;
   // Critica Data
   if Trim(dtCotacao.Text) = '' then
   begin
      ShowMessage('Faltam Preencher Data ...');
      Exit;
   end;

   if not AtualizaBeta(dtCotacao.DateTime) then
      bbtnCancelar.Click;

end;

procedure TfrmCalculaBetaCarteira.FormShow(Sender: TObject);
begin
  inherited;
   dtCotacao.DateTime := pRPI.DATAULTFECH;
end;

function TfrmCalculaBetaCarteira.AtualizaBeta(dtCotacao: TDateTime): boolean;
var
    ID: Integer;
begin
   Result := False;
   try
      try
         if not DtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.StartTransaction;

         // Limpa Histórico se houver
         with qryDelHistBeta do
         begin
            ParamByName('DATAHISTBETA').AsString := DateToStr(dtCotacao);
            ExecSQL;
         end;
         // Calcula Betas
         qryCarteiras.Close;
         qryCarteiras.SQL.Clear;
         qryCarteiras.SQL.Add('SELECT DISTINCT DATACOTACAO ');
         qryCarteiras.SQL.Add('FROM COTACAOBETA ');
         qryCarteiras.SQL.Add('WHERE DATACOTACAO = TO_DATE(''' + DateToStr(dtCotacao) + ''',''DD/MM/YYYY'')');
         qryCarteiras.Open;

         if qryCarteiras.IsEmpty then
            Exception.Create('As Cotações do Indice Beta Não Foram Importadas.');

         qryCarteiras.Close;
         qryCarteiras.SQL.Clear;
         qryCarteiras.SQL.Add('SELECT PARAMETROS.IDPARAMIMPEXCEL, CARTEIRA.IDCARTEIRAINVEST, CARTEIRA.IDCARTEIRAGERENC, CARTEIRA.IDPLANPREVCTBPATR ');
         qryCarteiras.SQL.Add('FROM (SELECT DISTINCT IDCARTEIRAINVEST, IDCARTEIRAGERENC,IDPLANPREVCTBPATR ');
         qryCarteiras.SQL.Add('      FROM HISTCARTINV ');
         qryCarteiras.SQL.Add('      WHERE');
         qryCarteiras.SQL.Add('            IDTIPOINVEST = 2 ) CARTEIRA, ');
         qryCarteiras.SQL.Add('     (SELECT IDPARAMIMPEXCEL ');
         qryCarteiras.SQL.Add('      FROM PARAMIMPORTEXCEL ');
         qryCarteiras.SQL.Add('      WHERE FLGTPCOTACAO = ''B'') PARAMETROS');
         qryCarteiras.Open;

         while not qryCarteiras.Eof do
         begin
            ProgressBar1.Min  := 0;
            ProgressBar1.Max  := qryCarteiras.RecordCount;
            ProgressBar1.Step := 1;

            with dtmOperComum.qryBetaCarteira do
            begin
               ProgressBar1.Stepit;
               OperComum.LimpaParametros(dtmOperComum.qryBetaCarteira);
               ParamByName('IDCARTEIRAINVEST').AsInteger    := qryCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger;
               if not qryCarteiras.FieldByName('IDCARTEIRAGERENC').IsNull then
                  ParamByName('IDCARTEIRAGERENC').AsInteger := qryCarteiras.FieldByName('IDCARTEIRAGERENC').AsInteger;
               ParamByName('DATAMOVCARTINV').AsString       := DateToStr(dtCotacao);
               ParamByName('IDPLANPREVCTBPATR').AsInteger   := qryCarteiras.FieldByName('IDPLANPREVCTBPATR').AsInteger;
               ParamByName('IDPARAMIMPEXCEL').AsInteger     := qryCarteiras.FieldByName('IDPARAMIMPEXCEL').AsInteger;
               Open;
            end;
            if not (dtmOperComum.qryBetaCarteira.IsEmpty) then
            begin
               with qryInsBetaCarteira do
               begin
                  OperComum.LimpaParametros(qryInsBetaCarteira);
                  ID := LeUltRegistro(nil,'HISTBETACARTEIRA');
                  ParamByName('IDHISTBETA').AsInteger          := ID;
                  ParamByName('IDPARAMIMPEXCEL').AsInteger     := qryCarteiras.FieldByName('IDPARAMIMPEXCEL').AsInteger;
                  ParamByName('IDCARTEIRAINVEST').AsInteger    := qryCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger;

                  if not qryCarteiras.FieldByName('IDCARTEIRAGERENC').IsNull then
                     ParamByName('IDCARTEIRAGERENC').AsInteger := qryCarteiras.FieldByName('IDCARTEIRAGERENC').AsInteger;

                  ParamByName('IDPLANPREVCTBPATR').AsInteger   := qryCarteiras.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  ParamByName('DATAHISTBETA').AsString         := DateToStr(dtCotacao);
                  ParamByName('VLRBETA').AsFloat               := dtmOperComum.qryBetaCarteiraVLRBETACART.AsFloat;
                  ParamByName('VLRCARTEIRA').AsFloat           := dtmOperComum.qryBetaCarteiraTOTALSALDO.AsFloat;
                  Prepare;
                  ExecSQL;
               end;
            end;
            qryCarteiras.Next;
         end;
         Result := True;
         DtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema ',mtConfirmation,[mbOK],0);
      except on E: Exception do
         begin
            Result := False;
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um problema no cálculo do Indice Beta das Carteiras '+
                    E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      end;
   finally
      ProgressBar1.Min  := 0;
      ProgressBar1.Max  := 0;
      ProgressBar1.Step := 0;
      ProgressBar1.Stepit;
   end;
end;


end.


