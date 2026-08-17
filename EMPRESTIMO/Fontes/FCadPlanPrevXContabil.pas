{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadPlanPrevXContabil;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroGridCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc,
   MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
   StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
   ExtCtrls, wwdblook;

type
   TfrmCadPlanPrevXContabil = class(TfrmCadastroGridCSImob)
      DBcboPlanoPrev: TwwDBLookupCombo;
      Label2: TLabel;
      DBcboEntidadeContabil: TwwDBLookupCombo;
      Label1: TLabel;
      qryIDPLANOPREV: TFloatField;
      qryIDPLANPREVC: TFloatField;
      qryPLANO_PREV: TStringField;
      qryENTIDADE_CONTABIL: TStringField;

      procedure FazerRefresh; override;
      procedure FechaQueries; override;

      procedure FormShow(Sender: TObject);
      procedure DBcboPlanoPrevCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboEntidadeContabilCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);


   private { Private declarations }

      procedure AbreQueries;


   public { Public declarations }


   end;



var
  frmCadPlanPrevXContabil: TfrmCadPlanPrevXContabil;



implementation
{$R *.DFM}
uses
   uSistema, dLookEmptmo;



procedure TfrmCadPlanPrevXContabil.FazerRefresh;
begin
   dtmLookEmptmo.qryLookPlanPrev.Close;
   dtmLookEmptmo.qryLookPlanPrevContab.Close;

   dtmLookEmptmo.qryLookPlanPrev.Open;
   dtmLookEmptmo.qryLookPlanPrevContab.Open;
end;



procedure TfrmCadPlanPrevXContabil.AbreQueries;
begin
   dtmLookEmptmo.qryLookPlanPrev.Open;
   dtmLookEmptmo.qryLookPlanPrevContab.Open;
end;



procedure TfrmCadPlanPrevXContabil.FechaQueries;
begin
   inherited;
   dtmLookEmptmo.qryLookPlanPrev.Close;
   dtmLookEmptmo.qryLookPlanPrevContab.Close;
end;



procedure TfrmCadPlanPrevXContabil.FormShow(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;



procedure TfrmCadPlanPrevXContabil.DBcboPlanoPrevCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if qry.State in dsEditModes then qryPLANO_PREV.AsString := DBcboPlanoPrev.Text;
end;



procedure TfrmCadPlanPrevXContabil.DBcboEntidadeContabilCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if qry.State in dsEditModes then qryENTIDADE_CONTABIL.AsString := DBcboEntidadeContabil.Text;
end;



procedure TfrmCadPlanPrevXContabil.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;

   case CmeCadastro.Operacao of
      opInserir:  Accept := Sistema.GravaLogOperacoes('Cad Plan Prev X Entidade Contábil. Inserção.');
      opAlterar:  Accept := Sistema.GravaLogOperacoes('Cad Plan Prev X Entidade Contábil. Alteração.');
      opApagar:   Accept := Sistema.GravaLogOperacoes('Cad Plan Prev X Entidade Contábil. Exclusão.');
   end;

   if not(Accept) then Raise Exception.Create('Falha na gravação do Log da operação.');
end;



end.
