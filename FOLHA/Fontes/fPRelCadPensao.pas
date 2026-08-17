// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Pendência   : SIG TIBERO
//Responsável : Everson Luiz Pereira da Cunha
//Data        : 22/02/2018
//Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------

unit fPRelCadPensao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, uAdmPrevFB,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmPRelCadPensao = class(TfrmOkCancelar)
    qryRubrica: TwwQuery;
    dbcmbRubrica: TwwDBLookupCombo;
    cboxPensaoAlim: TCheckBox;
    cboxCancelado: TCheckBox;
    Label1: TLabel;
    Bevel1: TBevel;
    edData: TCMDateTimePicker;
    Label2: TLabel;
    Bevel2: TBevel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cboxPensaoAlimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbcmbRubricaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelCadPensao: TfrmPRelCadPensao;

implementation

uses dRelFolha;


{$R *.DFM}

procedure TfrmPRelCadPensao.bbtnConfirmarClick(Sender: TObject);
begin
 inherited;
  dtmRelFolha.qryRelCadPensao.SQL.Clear;
  dtmRelFolha.qryRelCadPensao.SQL.Add(

'SELECT                                                           '+
'	R.IDPESSOA,                                                     '+
'	PPP.INSCRICAONUMERO,                                            '+
'	P.NOME,                                                         '+
'	PD.DESCRICAO AS RUBRICA,                                        '+
'	R.IDFAVORECIDO,                                                 '+
'	DECODE(FAV.NOME,NULL,''O PRÓPRIO'',FAV.NOME) AS FAVORECIDO,     '+
'	R.VALORRUBRICA,                                                 '+
'	R.DATAINICIO,                                                   '+
'	R.DATAFINAL,                                                    '+
'	R.IDREGRACALCULO                                                '+
'                                                                 '+
'FROM                                                             '+
'	PESSOA P,                                                       '+
'	PESSOA FAV,                                                     '+
'	RUBRICAINDIV R,                                                 '+
'	PROVDESC PD,                                                    '+
'	PARTPREVPLAN PPP                                                '+
//'WHERE 1 = 1  AND FLGPENSAOALIM = 1                               '); //Everson TIBERO
'WHERE 1 = 1  AND R.FLGPENSAOALIM = 1                               '); //Everson TIBERO

dtmRelFolha.qryRelCadPensao.SQL.Add(
'  AND (P.IDPESSOA		   = R.IDPESSOA)                          '+
'  AND (FAV.IDPESSOA(+) 	= R.IDFAVORECIDO)                     '+
'  AND (PD.IDPROVENTO		= R.IDRUBRICA)                        '+
'  AND (PPP.IDPESSOA 		= R.IDTITULAR)                        '+
'  AND (PPP.SEQPROPOSTA	= 1)                                      '+
'ORDER BY 	PPP.INSCRICAONUMERO                                   ');
  ModalResult := MrOk;
end;

procedure TfrmPRelCadPensao.cboxPensaoAlimClick(Sender: TObject);
begin
  inherited;
  // Atualiza a qryRubrica.
  if cboxPensaoAlim.Checked then
  begin
    qryRubrica.Close;
    qryRubrica.Open;
  end;
end;

procedure TfrmPRelCadPensao.FormCreate(Sender: TObject);
begin
  inherited;
  qryRubrica.Close;
  qryRubrica.Prepare;
  qryRubrica.ParamByName('FUNDACAO').AsInteger := iIdFundacao;
  qryRubrica.Open;
end;

procedure TfrmPRelCadPensao.dbcmbRubricaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dbcmbRubrica.LookupValue <> '' then
    cboxPensaoAlim.Checked := false;
end;

end.
