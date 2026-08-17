unit FCadDescontoContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, mContrato, CmEventosCadastro, Db, Wwdatsrc, DBTables,
  Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, TB97, ComCtrls, ExtCtrls, Wwdotdot,
  Wwdbcomb, wwdbedit, Wwdbspin, Mask, DBCtrls, wwdblook;

type
  TfrmCadDescontoContrato = class(TfrmCadastroDetalhe)
    molContrato1: TmolContrato;
    Panel5: TPanel;
    Label2: TLabel;
    DBcboAlterador: TwwDBLookupCombo;
    Label1: TLabel;
    DBedtDescricao: TDBEdit;
    DBedtVlr: TDBEdit;
    DBspnAno: TwwDBSpinEdit;
    DBcboMes: TwwDBComboBox;
    Label3: TLabel;
    DBspnRepetir: TwwDBSpinEdit;
    Label4: TLabel;
    lblRepetir: TLabel;
    lblMeses: TLabel;
    qryIDDESCONTO: TFloatField;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryDCCMESCOMPETENCIA: TFloatField;
    qryDCCANOCOMPETENCIA: TFloatField;
    qryCODALTERADOR: TFloatField;
    qryDCCVLR: TFloatField;
    qryFLGCONCEDIDO: TFloatField;
    qryDCCDESCRICAO: TStringField;
    qryDESCRICAO: TStringField;
    qryInsertDesconto: TwwQuery;

    procedure molContrato1btnBuscaContratoClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);

  private { Private declarations }
    procedure AbreQueries; override;

  public { Public declarations }

  end;



var
  frmCadDescontoContrato: TfrmCadDescontoContrato;



implementation
{$R *.DFM}
uses
   uSistema, dBaseDados, uDataBase, dLookImobiliario, dMS, uFuncoesImob, uDiasInuteis,
   uMensErro;




procedure TfrmCadDescontoContrato.AbreQueries;
begin
   with dtmLookImobiliario.qryLookAlterador do begin
      LimpaParametros(dtmLookImobiliario.qryLookAlterador);
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString           := 'R';
      ParamByName('PACRESDECRES').AsString      := 'C';
      Open;
   end;

   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;
      Open;
   end;
end;



procedure TfrmCadDescontoContrato.molContrato1btnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContrato1.btnBuscaContratoClick(Sender);

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Imovel.RetornouValor then begin
      Screen.Cursor := crHourGlass;
      CmeCadastroFind(self);
      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmCadDescontoContrato.CmeCadastroFind(Sender: TObject);
begin
   AbreQueries;
   inherited;
end;



procedure TfrmCadDescontoContrato.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   qryIDCONTRATOIMOVEL.AsInteger := molContrato1.iContrato;

   lblRepetir.Enabled   := True;
   DBspnRepetir.Value   := 1;
   DBspnRepetir.Enabled := True;
   lblMeses.Enabled     := True;

   qryDCCMESCOMPETENCIA.AsInteger   := DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(Date, 1));
   qryDCCANOCOMPETENCIA.AsInteger   := DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(Date, 1));

   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadDescontoContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qry.Close;

   dtmLookImobiliario.qryLookAlterador.Close;

   inherited;
end;



procedure TfrmCadDescontoContrato.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   lblRepetir.Enabled   := False;
   DBspnRepetir.Value   := 1;
   DBspnRepetir.Enabled := False;
   lblMeses.Enabled     := False;

   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadDescontoContrato.CmeCadastroConfirma(Sender: TObject);
var
   iDesconto, iContrato, iAlterador : int64;
   iMesBase, iAnoBase, iMes, iAno   : integer;
   i, j           : integer;
   sDescricao     : string;
   fVlrDesconto   : currency;
begin
   if DBspnRepetir.Value > 1 then begin

      iDesconto      := LeUltRegistro(nil, 'DESCONTOCONTRATO');
      sDescricao     := qryDCCDESCRICAO.AsString;
      iAlterador     := qryCODALTERADOR.AsInteger;
      fVlrDesconto   := qryDCCVLR.AsFloat;
      iAnoBase       := qryDCCANOCOMPETENCIA.AsInteger;
      iMesBase       := qryDCCMESCOMPETENCIA.AsInteger;

      j := word(trunc(DBspnRepetir.Value));
      for i := 1 to j do begin

         with qryInsertDesconto do begin
            LimpaParametros(qryInsertDesconto);

            ParamByName('PIDDESCONTO').AsInteger         := iDesconto;
            ParamByName('PIDCONTRATOIMOVEL').AsInteger   := molContrato1.iContrato;
            ParamByName('PCODALTERADOR').AsInteger       := iAlterador;
            ParamByName('PDCCVLR').AsCurrency            := fVlrDesconto;
            ParamByName('PDCCDESCRICAO').AsString        := sDescricao;

            ParamByName('PDCCANOCOMPETENCIA').AsInteger  := iAnoBase;
            ParamByName('PDCCMESCOMPETENCIA').AsInteger  := iMesBase;

            if i > 1 then begin
               iAno  := DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(EncodeDate(iAnoBase, iMesBase, 01), (i-1)));
               iMes  := DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(EncodeDate(iAnoBase, iMesBase, 01), (i-1)));

               ParamByName('PDCCANOCOMPETENCIA').AsInteger  := iAno;
               ParamByName('PDCCMESCOMPETENCIA').AsInteger  := imes;
            end;

            ExecSQL;
         end;

      end;

      CmeCadastroCancel(self);
      AbreQueries;

   end else begin
      if qry.State = dsInsert then qryIDDESCONTO.asInteger := LeUltRegistro(nil, 'DESCONTOCONTRATO');
      inherited;
   end;
end;



procedure TfrmCadDescontoContrato.CmeCadastroDelete(Sender: TObject);
begin
   if qryFLGCONCEDIDO.AsInteger = 0 then begin
      inherited;
   end else begin
      MsgDlg('Não é possível excluir um desconto já concedido!', 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      CmeCadastroCancel(self);
   end;
end;



end.
