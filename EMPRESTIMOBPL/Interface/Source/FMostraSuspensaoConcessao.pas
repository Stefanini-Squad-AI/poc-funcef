{-----------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES --------------------------------------------------
------------------------------------------------------------------------------
Pendência   : SOL 158097 Kintana 1276573
Responsável : BRUNO AZEVEDO
Data        : 20/05/2011
Descrição   : Alterado o nome da funcionalidade para "Bloqueio de Suspensão".
--------------------------------------------------------------------------------
Pendência   : SOL 139631 Kintana 860008
Responsável : Fanuel Junior
Data        : 25/01/2011
Descrição   : Exibir o label 'PRAZO INDETERMINADO' na tela suspensão de concessão
quando o campo FLGPRAZOINDETERMINADO for igual a 'S'
--------------------------------------------------------------------------------}
unit FMostraSuspensaoConcessao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, Db, fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DBCtrls, wwdbdatetimepicker,
  Mask, DBCGrids;

type
  TfrmMostraSuspensaoConcessao = class(TfrmSairAjudaImob)
    dsSuspensaoConcessao: TDataSource;
    dbgConsulta: TDBCtrlGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtDataInicio: TwwDBDateTimePicker;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    lblTitulo: TfcLabel;
    lblPrazoIndeterminado: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMostraSuspensaoConcessao: TfrmMostraSuspensaoConcessao;

implementation

uses DLookEmptmo;

{$R *.DFM}

end.
