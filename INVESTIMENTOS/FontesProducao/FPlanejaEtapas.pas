unit FPlanejaEtapas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, Mask, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, DBTables, Db, Wwdatsrc, Wwquery, DBGrids, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmPlanejaEtapas = class(TForm)
    PnlEtapas: TPanel;
    Label5: TLabel;
    Label6: TLabel;
	 BtConfPlan: TBitBtn;
    BtCancPlan: TBitBtn;
    QryBuscaEtapas: TwwQuery;
    DsBuscaEtapas: TwwDataSource;
    dsEtapaContrato: TwwDataSource;
    UpdateSQL1: TUpdateSQL;
    BtPlaneja: TBitBtn;
    CheckBox1: TCheckBox;
    qryEtapaContrato: TwwQuery;
    dteDataPrevista: TCMDateTimePicker;
    DBGrid1: TDBGrid;
    procedure BtPlanejaClick(Sender: TObject);
    procedure BtConfPlanClick(Sender: TObject);
    procedure BtCancPlanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wIdProcesso:Integer;
  end;

var
  FrmPlanejaEtapas: TFrmPlanejaEtapas;

implementation

{$R *.DFM}

//-------------------------------------------------------
// Botao de Planejamento de Etapas - Fecha Formulario
procedure TFrmPlanejaEtapas.BtPlanejaClick(Sender: TObject);
begin
	Close;
end;

//-------------------------------------------------------
// Botao Confirma Etapa de Planejamento
procedure TFrmPlanejaEtapas.BtConfPlanClick(Sender: TObject);
var
  IdContratoInvest,IdTipoContrInvest,SeqContratoInvest :LongInt;
begin

	qryEtapaContrato.Close;
	qryEtapaContrato.ParamByName('IDCONTRATOINVEST').AsInteger	:= QryBuscaEtapas.ParamByName('IDCONTRATOINVEST').AsInteger;
	qryEtapaContrato.ParamByName('IDTIPOCONTRINVEST').AsInteger := QryBuscaEtapas.ParamByName('IDTIPOCONTRINVEST').AsInteger;
	qryEtapaContrato.ParamByName('SEQCONTRATOINVEST').AsInteger := QryBuscaEtapas.ParamByName('SEQCONTRATOINVEST').AsInteger;
	qryEtapaContrato.Open;

// Cancela ou Confirma de Acordo com o Titulo do Botao
	If BtConfPlan.Caption = '&Confirmar' then
	begin
		try
			qryEtapaContrato.Post;

			IdContratoInvest	:= QryBuscaEtapas.FieldByName('IdContratoInvest').AsInteger;
			IdTipoContrInvest := QryBuscaEtapas.FieldByName('IdTipoContrInvest').AsInteger;
			SeqContratoInvest	:= QryBuscaEtapas.FieldByName('SeqContratoInvest').AsInteger;

			QryBuscaEtapas.Close;
			QryBuscaEtapas.Open;

			QryBuscaEtapas.Locate('IdContratoInvest;IdTipoContrInvest;SeqContratoInvest',
									VarArrayOf([IdContratoInvest,IdTipoContrInvest,SeqContratoInvest]),[]);

			QryBuscaEtapas.Next;

			BtPlaneja.Enabled :=	True;
		except
			ShowMessage('Erro ao atualizar registro ...');
		end;

		BtConfPlan.Caption			:= '&Alterar';
		dteDataPrevista.Enabled   	:=	False;
		CheckBox1.Enabled		 		:=	False;

	end
	else
	begin
		qryEtapaContrato.Edit;
		BtConfPlan.Caption		:= '&Confirmar';
		dteDataPrevista.Enabled	:=	True;
		CheckBox1.Enabled 		:=	True;
		BtPlaneja.Enabled 		:=	False;
		dteDataPrevista.SetFocus;
	end;
end;

//-------------------------------------------------------
// Botao Cancelar Etapa de Planejamento
procedure TFrmPlanejaEtapas.BtCancPlanClick(Sender: TObject);
begin
// Cancela
	qryEtapaContrato.Cancel;
	if BtConfPlan.Caption = '&Confirmar' then
	begin
		dteDataPrevista.Enabled		:=False;
		CheckBox1.Enabled :=False;
		BtPlaneja.Enabled	:=True;
	end
	else
		Close;
end;

//----------------------------------------------------
// Abre Formulario - Com os Dados Abertos
procedure TFrmPlanejaEtapas.FormShow(Sender: TObject);
begin
  QryBuscaEtapas.Close;
  QryBuscaEtapas.ParamByName('IDCONTRATOINVEST').AsInteger:=wIdProcesso;
  QryBuscaEtapas.Open;
end;

end.
