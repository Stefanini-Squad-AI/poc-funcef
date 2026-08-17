{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FParamRelApropContabil;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics, Controls, Forms  ,
  FOkCancelar, IvDictio, IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr   , TB97    , ExtCtrls, Spin    , DBCtrls , Dialogs , Db     ,
  DBTables   , Wwquery , Wwdatsrc, wwdblook, usistema, dbasedados;

type
  TfrmApropContabil = class(TfrmOkCancelar)
    grpMesRef: TGroupBox;
    dblkfolha: TwwDBLookupCombo;
    qryHist: TwwQuery;
    qryHistHISTORICO: TStringField;
    qryHistIDHSTFOLHABENEF: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApropContabil: TfrmApropContabil;

implementation

uses dRelFolha, UMensErro, uAdmPrevFB;

{$R *.DFM}

procedure TfrmApropContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Fecha Query
  QryHist.Close;
  // Destroi Form
  Action := caFree;
end;

procedure TfrmApropContabil.bbtnConfirmarClick(Sender: TObject);
Var sAnoMes: String;
    bFaz   : Boolean;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Inicializa variáveis
  bFaz    := True;
  sAnoMes := '';
  // Verifica se Patrocinadora foi escolhida
  If dblkfolha.Text = '' Then
   Begin
     MsgDlg('A Patrocinadora é obrigatória !','Aviso', mtInformation,[mbOk,mbHelp],0);
     bFaz := False;
   End;
   If bFaz Then
    Begin
    end;
end;

procedure TfrmApropContabil.FormCreate(Sender: TObject);
begin
  inherited;
  // Abre Query
  QryHist.Open;
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

