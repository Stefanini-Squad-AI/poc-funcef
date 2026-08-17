{-------------------------------------------------------------------------------
Data...............: 19/10/2011
SOL................: 136331
Kintana............: 814994
Autor..............: Ricardo de Freitas Araújo
Descrição..........: Criação da Control
-------------------------------------------------------------------------------}

unit uCtrlControle_Atos_Gestao;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uCMTypes, uCtrlDocumento,
     uCtrlLancamento, uCtrlFinanc, uCtrlImpostoRetido, UCtrlOrcamento, uCtrlPadroes, Db,
     uCMClientDataSet, Wwquery,Forms,Fprogresso,Dialogs,USistema;

type
    TCtrlControle_Atos_Gestao   = class(TCmControlObject)

    private
    FcdsContrato: TClientDataSet;
    procedure SetcdsContrato(const Value: TClientDataSet);

    public
          constructor Create; override;
          destructor  Destroy; override;
          function    ListarContratos(dtInicio,dtFim:TDateTime;TipoLocacao,TipoAlienacao:Boolean):OleVariant;
          function    Enviar():boolean;

          property cdsContrato: TClientDataSet read FcdsContrato write SetcdsContrato;
end;

var
   CtrlControle_Atos_Gestao:TCtrlControle_Atos_Gestao;

implementation

{ TCtrlControle_Atos_Gestao }

constructor TCtrlControle_Atos_Gestao.Create;
begin
  inherited;
  
end;

destructor TCtrlControle_Atos_Gestao.Destroy;
begin
  inherited;

end;

function TCtrlControle_Atos_Gestao.Enviar: boolean;
var
  strSQL:String;
begin
     TRY
       try
          strSQL := '';

          if FcdsContrato = nil then
             raise Exception.Create('Clientdataset nã vinculado à rotina.');

          if FcdsContrato.IsEmpty then
             raise Exception.Create('Não há contratos para serem enviados');


          FcdsContrato.First;
          DoProgresso(['Preparando para envio...', 0, 0, FcdsContrato.RecordCount, FcdsContrato.RecNo, 'Preparando para envio...']);


          while not FcdsContrato.Eof do
          begin
               DoProgresso(['Enviando...',1,0,0,FcdsContrato.RecNo]);

               strSQL := ' INSERT INTO CM.CONTRATO_ATO_GESTAO ' +
                         ' ( ' +
                         '   DATA_ENVIO, ' +
                         '   IDPESSOA, ' +
                         '   IDCONTRATOIMOVEL, ' +
                         '   IDEVENTOIMOVEL, ' +
                         '   EVIDATA, ' +
                         '   FLGTIPOCONTRATO, ' +
                         '   TRGDTINCLUSAO, ' +
                         '   TRGUSERINCLUSAO ' +
                         ' ) ' +
                         ' VALUES ' +
                         ' ( ' +
                         '   SYSDATE, ' +
                             FcdsContrato.fieldbyname('IDPESSOA').AsString          + ', ' +
                             FcdsContrato.fieldbyname('IDCONTRATOIMOVEL').AsString  + ', ' +
                             FcdsContrato.fieldbyname('IDEVENTOIMOVEL').AsString    + ', ' +
                             QuotedStr(FcdsContrato.fieldbyname('DATA_EVENTO').AsString)       + ', ' +
                             QuotedStr(FcdsContrato.fieldbyname('FLGTIPOCONTRATO').AsString)  + ', ' +
                        '   SYSDATE, ' +
                        QuotedStr(Sistema.NomeUsuario)
                        +
                        ' ) ';

               ExecSQL(strSQL);
               FcdsContrato.next;
          end;

          //Commit
          ExecSQL('COMMIT');

       except
         on E:Exception Do
         begin
           //Rollback
           ExecSQL('ROLLBACK');
           Application.MessageBox(PChar('Ocorreu um erro ao enviar os contrato(s).' + #13 +
                                  'Tipo: ' + E.ClassName + #13 + E.Message),'Erro',48);
         end;
       end;
     finally
       DoProgresso(['',2]);
     end;
end;

function TCtrlControle_Atos_Gestao.ListarContratos(dtInicio,
  dtFim: TDateTime; TipoLocacao,TipoAlienacao:Boolean): OleVariant;
var
  strSQL:string;
begin

  strSQL := ' SELECT * FROM CM.VW_CONTRATOS_ATO_GESTAO ' +
            ' WHERE ' +
            ' DATA_EVENTO BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy',dtInicio)) + ' AND ' +
            QuotedStr(FormatDateTime('dd/mm/yyyy',dtFim));

  if (TipoLocacao) and (TipoAlienacao = false) then
     strSQL := strSQL + ' AND TIPOCONTRATO = ' + QuotedStr('Locação'); //0 - Locação

  if (TipoLocacao = false) and (TipoAlienacao) then
     strSQL := strSQL + ' AND TIPOCONTRATO = ' + QuotedStr('Alienação');//1 - Alienação

  Result := GetDataPacket(strSQL);
end;

procedure TCtrlControle_Atos_Gestao.SetcdsContrato(
  const Value: TClientDataSet);
begin
  FcdsContrato := Value;
end;

end.
