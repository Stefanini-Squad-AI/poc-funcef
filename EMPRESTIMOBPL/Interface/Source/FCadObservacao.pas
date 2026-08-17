unit FCadObservacao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCSImob, Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, StdCtrls,
   CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
   IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr,
   TB97Ctls, TB97, ExtCtrls, DBCtrls, UDataBase, ComCtrls;

type
   TfrmCadObservacao = class(TfrmCadastroCSImob)
      Label10: TLabel;
      DBRichEdit1: TDBRichEdit;

      qryHMEOBSERVACAO: TMemoField;
      qryIDHISTMOVEMPTMO: TFloatField;
      qryIDCONTRATOEMPTMO: TFloatField;

      procedure FormShow(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);


   private  // Private declarations

   public   // Public declarations

      iAcao       : Integer;
      IDContrato  : Int64;
      IDItem      : Int64;
      IDTipoEP    : Integer;

   end;



var
   frmCadObservacao: TfrmCadObservacao;



implementation
{$R *.DFM}
uses
   RContrato, uSistema, dEmptmo, uFuncoesEmptmo, uTypesEmptmo;



procedure TfrmCadObservacao.FormShow(Sender: TObject);
begin
   inherited;

   case iAcao of
      2: sbtnAlterarClick(Self);
   end;
end;



procedure TfrmCadObservacao.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;

   AplicaAlteracoes([qry]);

   bbtnSairClick(self);
end;



procedure TfrmCadObservacao.bbtnConfirmarClick(Sender: TObject);
var
   rLogTotalPrev : TLogTotalPrev;
begin
   // ----------------------------------------------------------------------------------------------

   LimpaRegistroLog(rLogTotalPrev);

   rLogTotalPrev.IDModulo   := Sistema.IDModulo;
   rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
   rLogTotalPrev.IDHistMov  := qryIDHISTMOVEMPTMO.AsFloat;
   rLogTotalPrev.Origem     := 15;
   rLogTotalPrev.Operacao   := 'Alteracao da Observacao';
   rLogTotalPrev.Data       := SysDate;
   rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
   rLogTotalPrev.Versao     := Sistema.Versao;

   GravaLogTotalPrev(rLogTotalPrev);

   // ----------------------------------------------------------------------------------------------

   inherited;
end;



end.
