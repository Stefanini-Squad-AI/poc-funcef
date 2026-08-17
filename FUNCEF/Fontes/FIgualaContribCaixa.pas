unit FIgualaContribCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery;

type
  TfrmIgualaContribCaixa = class(TfrmOkCancelar)
    Label1: TLabel;
    edmescob: TEdit;
    Label2: TLabel;
    QryAux: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIgualaContribCaixa: TfrmIgualaContribCaixa;

implementation

{$R *.DFM}

uses  UMensErro,  DBaseDados;

procedure TfrmIgualaContribCaixa.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

   if not dtmbasedados.dbBaseDados.InTransaction
   then dtmbasedados.dbBaseDados.StartTransaction;

   try


      qryaux.close;
      qryaux.sql.text := ' UPDATE TMPDESC T SET T.VALOR = (SELECT VALORRECEBIDO '+
                         '         FROM TMPDESC '+
                         '         WHERE IDPESSJUR =  91008 '+
                         '         AND MESCOBRANCA = '''+edmescob.text+''' '+
                         '         AND IDMODULO = 32 '+
                         '         AND IDDESCONTO = 1 '+
                         '         AND IDPLANOPREV = 66 '+
                         '         AND IDPESSOA = T.IDPESSOA '+
                         '         AND MESREFERENCIA = T.MESREFERENCIA '+
                         '         AND IDMOTIVO = T.IDMOTIVO  ), '+
                         ' T.VALORRECEBIDO = (SELECT VALORRECEBIDO '+
                         '         FROM TMPDESC '+
                         '         WHERE IDPESSJUR =  91008 '+
                         '         AND MESCOBRANCA = '''+edmescob.text+''' '+
                         '         AND IDMODULO = 32 '+
                         '         AND IDPLANOPREV = 66 '+
                         '         AND IDDESCONTO = 1 '+
                         '         AND IDPESSOA = T.IDPESSOA '+
                         '         AND MESREFERENCIA = T.MESREFERENCIA '+
                         '         AND IDMOTIVO = T.IDMOTIVO  ), '+
                         ' T.SITENVIO = 2 '+
                         ' WHERE T.IDPESSJUR =  91008 AND '+
                         ' T.MESCOBRANCA = '''+edmescob.text+''' AND '+
                         ' T.IDMODULO = 32 AND '+
                         ' T.IDDESCONTO = 21  AND '+
                         ' T.IDPLANOPREV = 66 '+
                         ' NVL(T.VALORRECEBIDO,0) > 0 AND '+
                         ' EXISTS ( SELECT 1 '+
                         '         FROM TMPDESC WHERE IDPESSJUR =  91008 '+
                         '         AND MESCOBRANCA = '''+edmescob.text+''' '+
                         '         AND IDMODULO = 32 '+
                         '         AND IDDESCONTO = 1 '+
                         '         AND IDPLANOPREV = 66 '+
                         '         AND IDPESSOA = T.IDPESSOA '+
                         '         AND MESREFERENCIA = T.MESREFERENCIA '+
                         '         AND NVL(VALORRECEBIDO,0) >0  )';
      qryaux.execsql;


      if MsgDlg( inttostr(qryaux.rowsaffected)+' registros atualizados na TMPDESC. Deseja efetivar?','Mensagem', mtConfirmation, [mbYes, mbNo],0) = mrYes
      then   dtmbasedados.dbBaseDados.Commit
      else   dtmbasedados.dbBaseDados.Rollback;

   except
      showmessage('Erro na atualização.');
      if dtmbasedados.dbBaseDados.InTransaction    then
      dtmbasedados.dbBaseDados.Rollback;
   end;

end;

end.
