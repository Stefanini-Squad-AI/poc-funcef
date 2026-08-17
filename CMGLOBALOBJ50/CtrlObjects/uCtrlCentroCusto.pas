{-------------------------------------------------------------------------------
------------------------- HISTÓRICO DE ALTERAÇÕES ------------------------------
--------------------------------------------------------------------------------
Pendência: MIGRACAO-ORACLE
Analista : edilaine
Data     : 13/10/2025
Solução  : remover concatenaçao de espaços nas contas contábeis
           mudança de CHAR para VARCHAR2 na migração
--------------------------------------------------------------------------------
 Responsável: Everson Cunha
 Data.......: 10/05/2021
 SIG........: 134236
 Descrição..: Histórico movimentação Centro Custo (Desmembramento, unificação..)
              DE/PARA
--------------------------------------------------------------------------------
 Responsável: Everson Cunha
 Data.......: 07/12/2021
 SIG........: 121175
 Descrição..: Remover a obrigatoriedade de inclusão do Gestor na criação dos
              centros de custo
--------------------------------------------------------------------------------
Rotina             : ListaCentroCusto
N. SIG..........   : 48344
Data da Alteração: : 21/12/2018
Alteração Form:    : uCtrlCentroCusto
Responsável:       : Everson Cunha
Descrição.......   : Segregação do inventário dos bens
                     De acordo com o MEG 075 de infraestrutura,
                     subitem 5.1.10.1 - A COPAD realizará inventário anual dos
                     Bens Patrimoniais, exceto os equipamentos de TI.
                     Os equipamentos de TI serão inventariados pela GETIF.
--------------------------------------------------------------------------------
Rotina             : RecuperaRespPorCentCust
N. SIG..........   : 60690
Data da Alteração: : 08/02/2018
Alteração Form:    : uCtrlCentroCusto
Responsável:       : Everson Luiz Pereira da Cunha
Descrição.......   : O sistema deve permitir a inclusão de mais de um substituto
                     sem a data de término de vigência estar preenchida.
                     Criar campo para ordenar os substitutos
--------------------------------------------------------------------------------
Rotina             : ListaCentroCusto, ListaLotacaoeSocial
N. SIG..........   : 59823.59824
Data da Alteração: : 07/12/2017
Alteração Form:    : uCtrlCentroCusto
Responsável:       : Cássio Florêncio Rovaroto
Descrição.......   : Remoção do campo CODLOTACAOESOCIAL das funções que
                     recuperam dados dos centros de custo.
--------------------------------------------------------------------------------
Autor......: Andre Imakawa
Data.......: 06/01/2016
Sol........: 258754/17869
PPM........: 1136600
Descrição..: Removido campo IdLotacaoeSocial e criado os campos
             CODLOTACAOESOCIAL e DESCCODLOTACAO.
--------------------------------------------------------------------------------
Autor......: Felipe A. Santos
Data.......: 08/12/2014
Sol........: 229874/16591
Kintana....: 544751
Descrição..: Criação do campo IdLotacaoeSocial.
--------------------------------------------------------------------------------
Autor......: Thiago Melo
Data.......: 07/10/2014
Sol........: 236997
PPM........: 478691
Descrição..: Ao excluir determinado centro de custo, o sistema tenta apagar a
             tabela CENTCUST antes da RESPCENTCUST, ocasionando um erro da
             constraint R_10739
--------------------------------------------------------------------------------
Autor......: Felipe A. Santos
Data.......: 13/09/2013
Sol........: 195376
Kintana....: 1866485
Descrição..: Criação da Aba Substitutos e inclusão dos campos Matrícula e
             Portaria no grid
--------------------------------------------------------------------------------
Autor......: Mosé Pietro
Data.......: 13/09/2012
Sol........: 176165
Kintana....: 1609814
Descrição..: Inclusão do campo código de área (CODAREA)
--------------------------------------------------------------------------------
Rotina.....: AtualizarResponsavelCentroCusto
Autor......: Higor Ferreira
Data.......: 12/06/2012
Sol........: 182148
Kintana....: 1649720
Descrição..: Correção da rotina de Atualização do Responsável passando o
             CodCentroCusto correto.
--------------------------------------------------------------------------------
Rotina.....: AtualizarResponsavelCentroCusto
Autor......: Thaise Amaral Martins
Data.......: 08/09/2011
Sol........: 142865
Kintana....: 917808
Descrição..: Correção da rotina de Atualização do Responsável, para que o
             IDCHEFE seja atualizado na tabela FUNCIONARIO quando é trocado o
             responsável.
--------------------------------------------------------------------------------
Rotina.....: AtualizarResponsavelCentroCusto
Autor......: Brunno Mattos - Alterado por Thaise Amaral Martins
Data.......: 11/11/2010
Sol........: 142865
Kintana....: 917808
Descrição..: Criação da rotina AtualizarResponsavelCentroCusto para que o
             responsável de um funcionário seja atualizado instantaneamente a
             partir do momento que o responsável de um determinado Centro de
             Custo for alterado.
--------------------------------------------------------------------------------
Autor......: Marilza Colpani
Data.......: 18/11/2009
Sol........: 127324
Kintana....: 673519
Descrição..: Correção do erro que acontece ao abrir a tela: Cadastros/Centro de
             Custo/Centro de Custo
--------------------------------------------------------------------------------
Rotina    : ListaCentroCusto
Data      : 23/02/2007
Pendencia : 24757
Descrição : Corrigido o campo que chama apenas os analiticos
--------------------------------------------------------------------------------
Rotina    : ListaCentroCusto
Data      : 23/02/2007
Pendencia : 24564
Descrição : Incluir um campo Default para chamar apenas os analiticos
--------------------------------------------------------------------------------
Rotina    : ListaCentCustXContasxCC, ListaCcustoXTipoRdxCCxConta
Data      : 21/05/2004
Pendencia : 15365
Descrição : Alterações decorrentes do De/Para
--------------------------------------------------------------------------------
Rotina    : -
Data      : 30/10/2003
Pendencia : 14804
Descrição : Alterações decorrentes do De/Para
--------------------------------------------------------------------------------
Rotina    : ListaCCustoUsrAtivos
Data      : 10/07/2003
Pendencia : 14238
Descrição :
--------------------------------------------------------------------------------
Rotina    : Várias
Data      : 27/05/2004 (término)
Pendencia : 15166
Descrição : Implementação do cadastro de responsáveis por centros de custo e de
            responsabilida e suas respectivas vigências.
--------------------------------------------------------------------------------}

unit uCtrlCentroCusto;

interface

uses
   DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
   uMidasUtil, uDbCentroCusto, uDbTipoRdxCcxConta, uDbContasxcc, ucmClientDataset,
   // Pendência 15166
   uDbRespCentCust;

type
// tccSoSintetica => Somente Sinteticos
// tccSoAnalitica    => Somente Analiticos
// tccAmbos => Todos
   TTipoCentCust = (tccSoSintetica,tccSoAnalitica,tccAmbos);

// toccCodigo  => Ordernar  por codigo
// toccNome    => Ordernar  por nome
   TTipoOrdemCentCust  = (toccCodigo, toccNome);

   TCtrlCentroCusto = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   private

      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _DbCentroCusto: TDbCentroCusto;
      _DbTipoRdxCcxConta: TDbTipoRdxCcxConta;
      _DbContasxcc: TDbContasxcc;

      // - Pendência 15166
      _DbRespCentCust : TDbRespCentCust;

      Fcds: TClientDataSet;
      FcdsAranha: TClientDataSet;
      FcdsContas: TClientDataSet;
      FcdsRespCentCust: TClientDataSet;
      FcdsRespCentCustSub: TClientDataSet; // Felipe A. Santos SOL 195376 KTN 1866485

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsAranha(const Value: TClientDataSet);
      procedure SetcdsContas(const Value: TClientDataSet);
      procedure SetcdsRespCentCust(const Value: TClientDataSet);
      procedure SetcdsRespCentCustSub(const Value: TClientDataSet); // Felipe A. Santos

   public
      IdChefe: String;
      property cds: TClientDataSet read Fcds write Setcds;
      property cdsAranha: TClientDataSet read FcdsAranha write SetCdsAranha;
      property cdsContas: TClientDataSet read FcdsContas write SetCdsContas;

      // Pendência 15166
      property cdsRespCentCust: TClientDataSet read FcdsRespCentCust write SetcdsRespCentCust;

      // Felipe A. Santos
      property cdsRespCentCustSub: TClientDataSet read FcdsRespCentCustSub write SetcdsRespCentCustSub;

      //-------------------------------------------------------------------------
      // Métodos
      //-------------------------------------------------------------------------
      constructor Create;  override;
      destructor  Destroy; override;

      //-------------------------------------------------------------------------
      // Metodos da Regra de Negócio
      //-------------------------------------------------------------------------
      function  ReplicarCC(IdEmpresa            : Double;
                           IdCentroCusto        : String;
                           IdCentroCustoOrigem  : String
                          ): Boolean;

      function  ReplicarAranha(IdEmpresa           : Double;
                               IdCentroCusto       : String;
                               IdCentroCustoOrigem : String
                              ): Boolean;

      function  ListaCentroCusto(IdEmpresa      : Double = 0;
                                 IdCentroCusto  : String = '';
                                 bAtivo         : Boolean = True;
                                 iOrdem         : Integer = 0;
                                 sStatus        : String = '';
                                // pendência 14804 - 30/10/2003
                                IDPlanCentCust  : Extended = 0;
                                // FIM  pendência 14804 - 30/10/2003
                                // P. 24564
                                // P. 24757 Corrigido o Default q era 'A'
                                sAnalitico     : String = ''

                                ): OleVariant;

      function  ListaCCustoUsr(IdEmpresa  : Double = 0;
                               IdUsuario  : Double = 0;
                               iOrdem     : Integer = 0
                              ): OleVariant;

      function  ListaAranhaXCC(IdEmpresa     : Double;
                               IdCentroCusto : String
                              ): OleVariant;

      function  ListaContasXCC(IdEmpresa     : Double;
                               IdCentroCusto : String
                              ): OleVariant;

      function  ListaCentCustCompleto(idUsuario          : Double;
                                      idEmpresa          : Double;
                                      iPlano             : Double;
                                      sPlaConta          : String;
                                      TipoCentCust       : TTipoCentCust;
                                      TipoOrdemCentCust  : TTipoOrdemCentCust;
                                      bApenasAtivos      : Boolean = True;
                                      idplancentCust     : double = 0 // pendência 15376 - 25/05/2004
                                     ): OleVariant;

      // pendência 15365 - 21/05/2004
      function ListaCentCustXContasxCC(idEmpresa, Plano: Extended;
                                       Placonta: string;
                                       IDPlanCentCust: Extended = 0): Olevariant;

      // pendência 15365 - 21/05/2004
      function ListaCcustoXTipoRdxCCxConta(idEmpresa: Extended;
                                           recPag, CodTipRecdes: String; IdPrograma: Extended = 0;
                                           IDPlanCentCust: Extended = 0): Olevariant;


      function  Excluir: Boolean;
      function  Gravar: Boolean;

      // P 03/02/06
      Function  CentCustExclui(pCodCentCust : Integer; IDEmpresa : Double) : Boolean;

      function excluirResponsavelCentCust (_codCentCust : Integer; _idEmpresa : Double) : Boolean; // Thiago Melo SOL 236997 PPM 478691

      {  - 10/07/2003 - Pendência 14238
        Função criada para buscar apenas os centros de custo ativos, baseada na função
        ListaCCustoUsr, que busca todos independente da situação. }
      function  ListaCCustoUsrAtivos(IdEmpresa: Double = 0; IdUsuario: Double = 0;
                                      iOrdem: Integer = 0): OleVariant;

      // Pendência 15166
      function RecuperaRespPorCentCust( iIdEmpresa : integer; sCodCentroCusto: string;
                                        sTipoRespCentCust : string = 'G' // Felipe A. Santos
                                        ) : OLEVariant;

      // SOL 182148 KTN 1649720 Higor Ferreira
      function AtualizarResponsavelCentroCusto(IDEmpresa : Double; idNovoChefe, sCodCentroCusto : String) : Boolean; //Brunno Mattos - SOL 142865 - KTN 917808
      //Cássio Rovaroto - SIG nº 59823.59824 - Início
      //function ListaLotacaoeSocial : OleVariant;  // Felipe A. Santos SOL 229874/16591 PPM 544751
      //Cássio Rovaroto - SIG nº 59823.59824 - Fim
      function ListaCentroCustoOrigem(CodCentroCusto : String): OleVariant;
  end;

implementation
{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

constructor TCtrlCentroCusto.Create;
begin
  inherited;
  _DbCentroCusto := TDbCentroCusto.Create(Self);
  _DbContasxcc   := TDbContasxcc.Create(Self);
  _DbTipoRdxCcxConta := TDbTipordxccxconta.Create(Self);

   // Pendência 15166
  _DbRespCentCust := TDbRespCentCust.Create( Self );
end;

destructor TCtrlCentroCusto.Destroy;
begin
  if IsAppServer then
     FreeCds([ Fcds, FcdsAranha, FcdsContas ]);

  _DbContasxcc.Free;
  _DbTipoRdxCcxConta.Free;
  _DbCentroCusto.Free;

  // Pendência 15166
  _DbRespCentCust.Free;


  inherited;
end;

procedure TCtrlCentroCusto.DoChangeDataBase;
begin
  inherited;
  _DbCentroCusto.DataBaseName := DatabaseName;
  _DbContasxcc.DataBaseName := DatabaseName;
  _DbTipoRdxCcxConta.DataBaseName := DatabaseName;

  // Pendência 15166
  _DbRespCentCust.DataBaseName := DatabaseName;
end;

procedure TCtrlCentroCusto.OnCreateAppServer;
begin
  inherited;
  FCds       := TClientDataSet.Create(nil);
  FCdsContas := TClientDataSet.Create(nil);
  FCdsAranha := TClientDataSet.Create(nil);
end;

function TCtrlCentroCusto.Excluir: Boolean;
var
  Msg: String;
begin
  if ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.ExcluirCentroCusto(Fcds.Data, fcdsAranha.Data, FcdsContas.Data, FcdsRespCentCust.Data, FcdsRespCentCustSub.Data); // alterado por Felipe A. Santos

     if Not Result then
        MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
     Try
        StartTransaction;

        Result := ApplyCds(FcdsRespCentCust, _DbRespCentCust, [], []);
        Msg    := _DbRespCentCust.MessageInfo;

        if Not Result then
           Raise Exception.Create(Msg);

        // Felipe A. Santos
        Result := ApplyCds(FcdsRespCentCustSub, _DbRespCentCust, [], []);
        Msg    := _DbRespCentCust.MessageInfo;

        if Not Result then
           Raise Exception.Create(Msg);
        // Felipe A. Santos SOL 195376 KTN 1866485 - fim

        Result := ApplyCds(fcdsaranha, _DbTipordxccxconta, [], []);
        Msg    := _DbTipoRdxCcxConta.MessageInfo;

        if Not Result then
           Raise Exception.Create(Msg);

        Result := ApplyCds(fcdscontas, _DbContasXCC, [], []);
        Msg    := _DbContasXCC.MessageInfo;

        if Not Result then
           Raise Exception.Create(Msg);

        Result := ApplyCds(fcds, _DbCentroCusto, [], []);
        Msg    := _DbCentroCusto.MessageInfo;

        if Not Result then
           Raise Exception.Create(Msg);

        Commit;
     except
        On E:Exception Do
        begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        end;
     end;
  end;
end;


// Pendência 15166
function TCtrlCentroCusto.Gravar: Boolean;
var
  Msg: String;
  _CdsAranha, _CdsContas, _CdsRespCentCust,
  _CdsRespCentCustSub { // Felipe A. Santos SOL 195376 KTN 1866485 }: TClientDataset;
begin
   if ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.GravarCentroCusto(Fcds.Data, fcdsAranha.Data, FcdsContas.Data);

      if Not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      _CdsAranha       := TClientDataset.Create(nil);
      _CdsContas       := TClientDataset.Create(nil);
      _CdsRespCentCust := TClientDataset.Create(nil);
      _CdsRespCentCustSub := TClientDataset.Create(nil);  // Felipe A. Santos

      Try
         _CdsAranha.Data          := FCdsAranha.Data;
         _CdsContas.Data          := FCdsContas.Data;
         _CdsRespCentCust.Data    := FCdsRespCentCust.Data;
         _CdsRespCentCustSub.Data := FCdsRespCentCustSub.Data; // Felipe A. Santos

         StartTransaction;
         Result := ApplyCds(fcds, _DbCentroCusto, [], []);
         Msg    := _DbCentroCusto.MessageInfo;

         if Not Result then
            Raise Exception.Create(Msg);

         Result := ApplyCds(_cdsAranha, _DbTipoRdxCcxConta, [_DbCentroCusto.IdEmpresa, _DbCentroCusto.CodCentroCusto],
                             [_DbTipoRdxCcxConta.IdEmpresa, _DbTipoRdxCcxConta.CodCentroCusto]);
         Msg    := _DbTipoRdxCcxConta.MessageInfo;

         if Not Result then
            Raise Exception.Create(Msg);

         Result := ApplyCds(_cdsContas, _DbContasXCC, [_DbCentroCusto.IdEmpresa, _DbCentroCusto.CodCentroCusto],
                             [_DbContasXCC.IdEmpresa, _DbContasXCC.CodCentroCusto]);
         Msg    := _DbContasXCC.MessageInfo;

         if Not Result then
            Raise Exception.Create(Msg);

         Result := ApplyCds(_CdsRespCentCust, _DbRespCentCust, [_DbCentroCusto.IdEmpresa, _DbCentroCusto.CodCentroCusto],
                             [_DbRespCentCust.IdEmpresa, _DbRespCentCust.CodCentroCusto]);
         Msg    := _DbRespCentCust.MessageInfo;

         if Not Result then
            Raise Exception.Create(Msg);

         // Felipe A. Santos
         Result := ApplyCds(_CdsRespCentCustSub, _DbRespCentCust, [_DbCentroCusto.IdEmpresa, _DbCentroCusto.CodCentroCusto],
                             [_DbRespCentCust.IdEmpresa, _DbRespCentCust.CodCentroCusto]);
         Msg    := _DbRespCentCust.MessageInfo;

         if Not Result then
            Raise Exception.Create(Msg);
         // Felipe A. Santos SOL 195376 KTN 1866485 - fim

         // SOL 182148 KTN 1649720 Higor Ferreira
         //Brunno Mattos - SOL 142865 - KTN 917808
         if IdChefe <> '' then //Everson Cunha - SIG121175
          Result := AtualizarResponsavelCentroCusto(_DbRespCentCust.Idempresa.Value, IdChefe, _DbRespCentCust.CodCentroCusto.value);

         if Not Result then
            Raise Exception.Create(Msg);

         Commit;
      Except
         On E:Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;

      _CdsAranha.Free;
      _CdsContas.Free;
      _CdsRespCentCust.Free;
      _CdsRespCentCustSub.Free; // Felipe A. Santos SOL 195376 KTN 1866485
   end;
end;



function TCtrlCentroCusto.ReplicarCC(IdEmpresa            : Double;
                                     IdCentroCusto        : String;
                                     IdCentroCustoOrigem  : String
                                    ): Boolean;
var
  sSQL, Msg: String;
begin
  if ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.ReplicarCC(IdEmpresa, IdCentroCusto, IdCentroCustoOrigem);

     if Not Result then
        MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
     Try
        StartTransaction;
        sSQL := 'DELETE FROM CONTASXCC WHERE RTRIM(CODCENTROCUSTO) = ' + QuotedStr(Trim(IdCentroCusto)) +
               ' and IDEMPRESA = ' + FloatToStr(IdEmpresa);
        Result := ExecSql(sSQL);

        sSQL := 'INSERT INTO CONTASXCC (PLANO, PLACONTA, IDEMPRESA, IDUSUARIOINCLUSAO, CODCENTROCUSTO) ' +
               '(SELECT PLANO, PLACONTA, IDEMPRESA, IDUSUARIOINCLUSAO, ' + QuotedStr(Trim(IdCentroCusto)) +
                  ' FROM CONTASXCC WHERE RTRIM(CODCENTROCUSTO) = ' + QuotedStr(Trim(IdCentroCustoOrigem)) +
                       ' and IDEMPRESA = ' + FloatToStr(IdEmpresa) + ')';
        Result := (Result and ExecSql(sSQL));
        Msg    := _DbCentroCusto.MessageInfo;

        if Not Result then
           Raise Exception.Create(Msg);

        Commit;
     except
        On E:Exception Do
        begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        end;
     end;
  end;
end;



function TCtrlCentroCusto.ReplicarAranha(IdEmpresa           : Double;
                                         IdCentroCusto       : String;
                                         IdCentroCustoOrigem : String
                                        ): Boolean;
var
  sSQL, Msg: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ReplicarAranha(IdEmpresa, IdCentroCusto,
                           IdCentroCustoOrigem);

      if Not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      Try
         StartTransaction;
         sSQL := 'DELETE FROM TIPORDXCCXCONTA WHERE RTRIM(CODCENTROCUSTO) = ' + QuotedStr(IdCentroCusto) +
                'and IDEMPRESA = ' + FloatToStr(IdEmpresa);
         Result := ExecSql(sSQL);

         sSQL := 'INSERT INTO TIPORDXCCXCONTA (IDTIPORDXCCXCONTA, IDEMPRESA, IDPROGRAMA, ' +
                       'PLANO, PLACONTA, PLACONTAPASS, IDPESSOA, RECPAG, CODTIPRECDES, CODCENTROCUSTO, IDPATRO) ' +
                '(SELECT SEQTIPORDXCCXCONTA.NEXTVAL, IDEMPRESA, IDPROGRAMA, PLANO, PLACONTA, PLACONTAPASS,  ' +
                  'IDPESSOA, RECPAG, CODTIPRECDES, ' + QuotedStr(Trim(IdCentroCusto))  + '   , IDPATRO  ' +
                   ' FROM TIPORDXCCXCONTA WHERE RTRIM(CODCENTROCUSTO) = ' + QuotedStr(Trim(IdCentroCustoOrigem)) +
                        ' and IDEMPRESA = ' + FloatToStr(IdEmpresa) + ')';

         Result := (Result and ExecSql(sSQL));
         Msg    := _DbCentroCusto.MessageInfo;

         if Not Result then
            Raise Exception.Create(Msg);

         Commit;
      except
         On E:Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;


function TCtrlCentroCusto.ListaCentroCusto(IdEmpresa       : Double = 0;
                                            IdCentroCusto  : String = '';
                                            bAtivo         : Boolean = True;
                                            iOrdem         : Integer = 0;
                                            sStatus        : String = '';
                                           // pendência 14804 - 30/10/2003
                                           IDPlanCentCust  : Extended = 0 ;
                                           // FIM  pendência 14804 - 30/10/2003
                                           // P. 24564  23/02/2007

                                           // - P. 24757 Corrigido o Default q era 'A'
                                            sAnalitico     : String = ''
                                           ): OleVariant;
var
   sSQL: String;
begin
   sSQL :=
   'SELECT '                              + #13 +
   // P. 24564 23/02/2007
   '   C.STATUSGRUPOCDC, '                + #13 +
   '   C.IDEMPRESA, '                     + #13 +
   '   C.IDPLANCENTCUST, '                + #13 +
   '   C.CODEXTERNO, '                    + #13 +
   '   C.CODCENTROCUSTO, '                + #13 +
   '   C.CODEXTERNO, '                    + #13 +
   '   C.NOME, '                          + #13 +
   '   C.RESPONSAVEL, '                   + #13 +
   '   C.IDUSUARIOINCLUSAO, '             + #13 +
   '   C.IDUSUARIO, '                     + #13 +
   '   C.CODREDUZIDO, '                   + #13 +
   '   C.CODCORRESP, '                    + #13 +
   '   C.STATUSGRUPOCDC, '                + #13 +
   '   C.ATIVO, '                         + #13 +
   '   C.IDPROGRAMA, '                    + #13 +

   '   PCC.DESCPLANCENTCUST, '            + #13 +
   '   P.NOME AS NOMEEMPRESA, '           + #13 +
   '   Q.NOME AS NOMEUSUARIOINCLUSAO, '   + #13 +
   '   U.NOMEUSUARIO, '                   + #13 +
//Cássio Rovaroto - SIG nº 59823.59824 - Início
//   '   C.CODAREA, '                       + #13 + //Mosé Pietro SOL 176165 KTN 1609814

// Andre Imakawa SOL 258754/17869 PPM 1136600 - Inicio
// Removido campo C.IDLOTACAO e incluso C.CODLOTACAOESOCIAL e LS.DESCRICAO
// '   C.IDLOTACAO, '                     + #13 + // Felipe A. Santos SOL 229874/16591 PPM 544751
//   '   C.CODLOTACAOESOCIAL, '             + #13 +
//   '   SUBSTR(LS.DESCRICAO, 1, 255) AS DESCCODLOTACAO ' + #13 +
// Andre Imakawa SOL 258754/17869 PPM 1136600 - Fim

//   'FROM '                                + #13 +
//   '   PESSOA         P, '                + #13 +
//   '   PESSOA         Q, '                + #13 +
//   '   CENTCUST       C, '                + #13 +
//   '   USUARIOSISTEMA U, '                + #13 +
//   '   PLANCENTCUST   PCC, '              + #13 +
//   '   PROGRAMA       R, '                + #13 +
//   '   LOTACAOESOCIAL LS '                + #13 +  // Andre Imakawa SOL 258754/17869 PPM 1136600 - add LOTACAOESOCIAL
   '   C.CODAREA, '                        + #13 +
   '   C.FLGINVENTARIOTI '               + #13 + //Everson Cunha - SIG48344
   'FROM '                                + #13 +
   '   PESSOA         P, '                + #13 +
   '   PESSOA         Q, '                + #13 +
   '   CENTCUST       C, '                + #13 +
   '   USUARIOSISTEMA U, '                + #13 +
   '   PLANCENTCUST   PCC, '              + #13 +
   '   PROGRAMA       R  '                + #13 +
//Cássio Rovaroto - SIG nº 59823.59824 - Fim
   'WHERE '                               + #13 ;

   //P. 24564 23/02/2007
  // P. 24757 Corrigido o Default q era 'A' e criado a condição abaixo.

   if Trim(sAnalitico) <> '' then sSQL := sSQL +
   '   C.STATUSGRUPOCDC = ' + QuotedStr( sAnalitico ) + 'AND' ;

   if IdEmpresa <> 0 then sSQL := sSQL +
   '   C.IDEMPRESA         = ' + FloatToStr(IdEmpresa) + ' AND ';

   if IDPlanCentCust <> 0 then sSQL := sSQL +
   '   C.IDPLANCENTCUST    = ' + FormatFloat('#0', IDPlanCentCust)    + ' AND ' + #13;

   if idCentroCusto <> '' then sSQL := sSQL +
   '   C.CODCENTROCUSTO    = ' + QuotedStr(Trim(IdCentroCusto)) + ' AND '  ;

   if bAtivo then sSQL := sSQL +
   '   ATIVO               = ''S'' AND ';

   if sStatus <> '' then sSQL := sSQL +
   '   STATUSGRUPOCDC      = ' + QuotedStr(UpperCase(sStatus)) + ' and ';

   sSQL := sSQL +
   '   C.IDEMPRESA         = P.IDPESSOA AND '            + #13 +
   '   C.IDUSUARIOINCLUSAO = Q.IDPESSOA AND '            + #13 +
   '   C.IDPLANCENTCUST    = PCC.IDPLANCENTCUST(+) AND ' + #13 +
   '   C.IDUSUARIO         = U.IDUSUARIO(+) AND '        + #13 +
   //Cássio Rovaroto - SIG nº 59823.59824 - Início
   //'   C.CODLOTACAOESOCIAL = LS.CODLOTACAOESOCIAL(+) AND '  + #13 + // Andre Imakawa SOL 258754/17869 PPM 1136600 - Join com a tb LOTACAOESOCIAL
   //Cássio Rovaroto - SIG nº 59823.59824 - Fim
   '   C.IDPROGRAMA        = R.IDPROGRAMA(+) ';
   if iOrdem = 0 then sSQL := sSQL +
   'ORDER BY C.CODEXTERNO'
   else sSQL := sSQL +
   'ORDER BY C.NOME';

    Result := GetDataPacket(sSQL);
end;



// Lista centro de custo por usuario
function TCtrlCentroCusto.ListaCCustoUsr(IdEmpresa  : Double = 0;
                                         IdUsuario  : Double = 0;
                                         iOrdem     : Integer = 0
                                        ): OleVariant;
var
  sSQL: String;
begin
   sSQL := 'SELECT C.CODCENTROCUSTO, C.IDEMPRESA, C.NOME ' +
            'FROM CENTCUST C, USCCUSTO U ' +
           'WHERE (C.IDEMPRESA = ' + FloatToStr(IdEmpresa) + ') ' +
             'and (C.STATUSGRUPOCDC = ''A'') ' +
             'and (C.IDEMPRESA = U.IDEMPRESA) ' +
             'and (C.CODCENTROCUSTO = U.CODCENTROCUSTO) ' +
             'and (U.IDUSUARIO = ' + FloatToStr(IdUsuario) + ') ';

  case IOrdem of
       0: sSQL := sSQL + 'ORDER BY NOME';
       1: sSQL := sSQL + 'ORDER BY CODCENTROCUSTO';
  end;

  Result := GetDataPacket(sSQL);
end;



function TCtrlCentroCusto.ListaContasXCC(IdEmpresa     : Double;
                                         IdCentroCusto : String
                                        ): OleVariant;
var
  sSQL: String;
begin
  sSQL := 'SELECT C.PLANO, C.PLACONTA, C.CODCENTROCUSTO, C.IDEMPRESA, C.IDUSUARIOINCLUSAO, P.PLANOME ' +
         'FROM CONTASXCC C, PLANOCONTA P ' +
         'WHERE C.IDEMPRESA = ' + FloatToStr(IdEmpresa) +
          ' and RTRIM(C.CODCENTROCUSTO) = ' + QuotedStr(Trim(IdCentroCusto)) +
          ' and C.PLANO = P.PLANO and C.PLACONTA = P.PLACONTA';
  Result := GetDataPacket(sSQL);
end;



function TCtrlCentroCusto.ListaAranhaXCC(IdEmpresa     : Double;
                                         IdCentroCusto : String
                                        ): OleVariant;
var
  sSQL: String;
begin
  sSQL := 'SELECT T.IDTIPORDXCCXCONTA, T.CODTIPRECDES, T.RECPAG, T.IDPESSOA,' +
                'T.PLANO, T.PLACONTA, T.CODCENTROCUSTO, T.IDEMPRESA, T.IDPROGRAMA, ' +
                'C.PLANOME, P.DESCPROGRAMA, R.DESCRICAO, T.PLACONTAPASS ' +
                //, PP.NOME AS PATROCINADORA ' +
           'FROM TIPORDXCCXCONTA T, PLANOCONTA C, TIPORECEBDESEMB R, PROGRAMA P, PATRO PT ' +
           //', PESSOA PP ' +
           'WHERE T.IDEMPRESA = ' + FloatToStr(IdEmpresa) +
           ' and RTRIM(T.CODCENTROCUSTO) = ' + QuotedStr(Trim(IdCentroCusto)) +
           ' and T.PLANO = C.PLANO' +
           ' and T.PLACONTA = C.PLACONTA ' +
           ' and T.RECPAG = R.RECPAG' +
           ' and T.IDPESSOA = R.IDPESSOA' +
           ' and T.CODTIPRECDES = R.CODTIPRECDES' +
           ' and T.IDPESSOA = PT.IDPESSOA   ' +
           //Marilza Colpani SOL 127324/KINTANA 673519
           //' and T.IDPATRO = PP.IDPESSOA   ' +
           ' and T.IDPROGRAMA = P.IDPROGRAMA(+)';
  Result := GetDataPacket(sSQL);
end;



function TCtrlCentroCusto.ListaCentCustCompleto(idUsuario          : Double;
                                                idEmpresa          : Double;
                                                iPlano             : Double;
                                                sPlaConta          : String;
                                                TipoCentCust       : TTipoCentCust;
                                                TipoOrdemCentCust  : TTipoOrdemCentCust;
                                                bApenasAtivos      : Boolean = True;
                                                idplancentCust     : double = 0 //andré Tavares - pendência 15376 - 25/05/2004
                                               ): OleVariant;
var
  sSQl: String;
begin
  if (sPlaConta <> '') and (iPlano <> 0) then
   begin
     // início - pendência 15376 - 25/05/2004
     sSql := 'SELECT C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC, C.CODEXTERNO ' +
    // fim -pendência 15376 - 25/05/2004
               'FROM CONTASXCC CC, CENTCUST C ' +
              'WHERE (CC.PLANO = ' + FloatToStr(iPlano) + ')' +
               ' and (CC.IDEMPRESA = ' + FloatToStr(IdEmpresa) + ')' +
               ' and (CC.PLACONTA = ' + QuotedStr(Trim(sPlaConta)) + ')';      //MIGRACAO-ORACLE
               //'                  ', 1, 18)) + ')' ;                         //MIGRACAO-ORACLE

     if bApenasAtivos then
      sSql := sSql +
               ' and ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL)) ' ;

      sSql := sSql +
               ' and (CC.CODCENTROCUSTO = C.CODCENTROCUSTO) ' +
               ' and (CC.IDEMPRESA = C.IDEMPRESA) ';

     // início  pendência 15376 - 25/05/2004
      if idplancentCust <> 0 then
        sSql := sSql + ' and C.IDPLANCENTCUST = ' + floatTostr(idplancentCust);
     // fim   pendência 15376 - 25/05/2004


     case TipoCentCust of
          tccSoSintetica: sSql := sSql + ' and (C.STATUSGRUPOCDC = ''S'') ';
          tccSoAnalitica: sSql := sSql + ' and (C.STATUSGRUPOCDC = ''A'') ';
     end;

     case TipoOrdemCentCust of
          // início - pendência 15376 - 25/05/2004
          toccCodigo: sSql := sSql + ' ORDER BY C.CODEXTERNO ';
          // fim - pendência 15376 - 25/05/2004
          toccNome  : sSql := sSql + ' ORDER BY C.NOME ';
     end;
  end else begin
          // início -  pendência 15376 - 25/05/2004
          sSql := 'SELECT U.CODCENTROCUSTO, U.NOME, U.STATUSGRUPOCDC, U.CODEXTERNO ' +
                  'FROM (SELECT C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC, C.CODEXTERNO ' +
          // fim - pendência 15376 - 25/05/2004
                        'FROM CENTCUST C ' +
                       'WHERE (C.IDEMPRESA = ' + FloatToStr(IdEmpresa) + ') ' ;

     if bApenasAtivos then
       sSql := sSql +   ' and ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL)) ';

     // início -  pendência 15376 - 25/05/2004
      if idplancentCust <> 0 then
        sSql := sSql + ' and C.IDPLANCENTCUST = ' + floatTostr(idplancentCust);
     // fim    -  pendência 15376 - 25/05/2004

     case TipoCentCust of
          tccSoSintetica: sSql := sSql + 'and (C.STATUSGRUPOCDC = ''S'') ';
          tccSoAnalitica: sSql := sSql + 'and (C.STATUSGRUPOCDC = ''A'') ';
     end;

     sSql := sSql + 'and (NOT EXISTS (SELECT X.IDUSUARIO FROM USCCUSTO X ' +
                                        'WHERE (X.IDPESSOA = ' + FloatToStr(IdEmpresa) + ') ' +
                                          'and (X.IDUSUARIO = ' + FloatToStr(IdUsuario) + ') ' +
                                          'and (X.IDEMPRESA = C.IDEMPRESA))) ' +
                    ' UNION ALL ' +
          // início - pendência 15376 - 25/05/2004
                    ' SELECT DISTINCT ' +
                    '        C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC, C.CODEXTERNO ' +
          // fim -  pendência 15376 - 25/05/2004
                    '   FROM CENTCUST C, USCCUSTO X '+
                    '  WHERE (C.IDEMPRESA = ' + FloatToStr(IdEmpresa) + ') ' ;

     if bApenasAtivos then
      sSql := sSql + '   and ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL)) ';

     // início - pendência 15376 - 25/05/2004
      if idplancentCust <> 0 then
        sSql := sSql + ' and C.IDPLANCENTCUST = ' + floatTostr(idplancentCust);
     // fim    - pendência 15376 - 25/05/2004

     case TipoCentCust of
          tccSoSintetica: sSql := sSql + 'and (C.STATUSGRUPOCDC = ''S'') ';
          tccSoAnalitica: sSql := sSql + 'and (C.STATUSGRUPOCDC = ''A'') ';
     end;

     sSql := sSql + 'and (X.IDPESSOA = ' + FloatToStr(IdEmpresa) + ') ' +
                    'and (X.IDUSUARIO = ' + FloatToStr(IdUsuario) + ') ' +
                    'and (C.CODCENTROCUSTO = X.CODCENTROCUSTO) ' +
                    'and (C.IDEMPRESA = X.IDEMPRESA) ' +
                    ') U ';

     case TipoOrdemCentCust of
          // inicio - pendência 15376 - 25/05/2004
          toccCodigo: sSql := sSql + 'ORDER BY U.CODEXTERNO ';
          // fim - pendência 15376 - 25/05/2004
          toccNome  : sSql := sSql + ' ORDER BY U.NOME';
     end;
  end;

  Result := GetDataPacket(sSql);
end;



procedure TCtrlCentroCusto.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;



procedure TCtrlCentroCusto.SetcdsAranha(const Value: TClientDataSet);
begin
  FcdsAranha := Value;
end;



procedure TCtrlCentroCusto.SetcdsContas(const Value: TClientDataSet);
begin
  FcdsContas := Value;
end;



function TCtrlCentroCusto.ListaCCustoUsrAtivos(IdEmpresa, IdUsuario: Double; iOrdem: Integer): OleVariant;
var
  sSQL: String;
begin
   sSQL :=
   'SELECT C.CODCENTROCUSTO, C.IDEMPRESA, C.NOME ' +
   'FROM CENTCUST C, USCCUSTO U ' +
   'WHERE (C.IDEMPRESA = ' + FloatToStr(IdEmpresa) + ') ' +
   'and (C.STATUSGRUPOCDC = ''A'') ' +
   'and (C.IDEMPRESA = U.IDEMPRESA) ' +
   'and (C.CODCENTROCUSTO = U.CODCENTROCUSTO) ' +
   'and (U.IDUSUARIO = ' + FloatToStr(IdUsuario) + ') ' +
   'and (C.ATIVO = ''S'') ';

   case IOrdem of
      0: sSQL := sSQL + 'ORDER BY NOME';
      1: sSQL := sSQL + 'ORDER BY CODCENTROCUSTO';
   end;

   Result := GetDataPacket(sSQL);
end; {ListaCCustoUsrAtivos}

// início - pendência 15365 - 21/05/2004
function TCtrlCentroCusto.ListaCentCustXContasxCC(idEmpresa, Plano: Extended;
                                                  Placonta: string;
                                                  IDPlanCentCust: Extended = 0): Olevariant;
var
  sSql : string;
  cdsLocal : TcmClientDataset;
begin
  cdsLocal := TcmClientDataSet.Create(nil);

  try
    sSql := ' SELECT DISTINCT '+
            '   CENT.CODEXTERNO, '+
            '   CENT.CODCENTROCUSTO, '+
            '   CENT.NOME, '+
            '   CENT.STATUSGRUPOCDC, '+
            '   CENT.IDPROGRAMA '+
            ' FROM '+
            '   CENTCUST CENT '+
            ' WHERE '+
            '   CENT.ATIVO = ''S'' AND '+
            '   CODCENTROCUSTO IN '+
            '       (SELECT '+
            '           CODCENTROCUSTO '+
            '        FROM '+
            '           CONTASxCC CONT '+
            '        WHERE '+
            '           CONT.IDEMPRESA = CENT.IDEMPRESA and '+
            '           CONT.CODCENTROCUSTO = CENT.CODCENTROCUSTO and '+
            '           CONT.IDEMPRESA = ' + FloatToStr(IdEmpresa) + ' and '+
            '           CONT.PLANO = '+ FloatToStr(Plano) + ' and ';

    if IDPlanCentCust <> 0 then
      sSQL := sSQL + ' CENT.IDPLANCENTCUST    = ' + FormatFloat('#0', IDPlanCentCust) +' AND ';

    sSql := sSql + ' RTRIM(CONT.PLACONTA) = '''+ Placonta +''' ) '+
                   ' ORDER BY '+
                   '    CENT.CODCENTROCUSTO, '+
                   '    CENT.STATUSGRUPOCDC DESC ';
    cdsLocal.Data := GetDataPacket(sSql);
    result := cdsLocal.Data;
  finally
    cdsLocal.Free;
  end;
end;


function TCtrlCentroCusto.ListaCcustoXTipoRdxCCxConta(idEmpresa: Extended;
         recPag, CodTipRecdes: String; IdPrograma: Extended = 0;
                                       IDPlanCentCust: Extended = 0): Olevariant;

var sSql : string;
    cdsLocal: TcmClientDataSet;
begin
  cdsLocal := TcmClientDataset.Create(nil);
  try
    sSql := ' SELECT DISTINCT '+
            '    C.CODEXTERNO, '+
            '    C.CODCENTROCUSTO, '+
            '    C.NOME, '+
            '    C.STATUSGRUPOCDC, '+
            '    C.IDPROGRAMA '+
            ' FROM '+
            '    TIPORDXCCXCONTA T, '+
            '    CENTCUST C '+
            ' WHERE '+
            '    C.ATIVO = ''S'' and '+
            '    (T.RECPAG = '+ quotedStr(recPag) +') and '+
            '    (T.IDPESSOA = '+ floatToStr(idEmpresa) +') and '+
            '    (RTRIM(T.CODTIPRECDES) = '+ quotedStr(CodTipRecdes) +') and ';

    if IdPrograma <> 0 then
      sSql := sSql + ' (T.IDPROGRAMA = ' + floatToStr(IdPrograma) + ') and ';

    if IDPlanCentCust <> 0 then
      sSql := sSql + ' (C.IDPLANCENTCUST = ' + floatToStr(IDPlanCentCust) + ') and ';

    sSql := sSql + '    (T.IDPESSOA = C.IDEMPRESA) and '+
                   '    (C.CODCENTROCUSTO = T.CODCENTROCUSTO) '+
                   ' ORDER BY '+
                   '    C.CODCENTROCUSTO, '+
                   '    C.STATUSGRUPOCDC DESC ';

    cdsLocal.Data := GetDataPacket(sSql);
    result := cdsLocal.Data;
  finally
    cdsLocal.Free;
  end;
end;

// fim - pendência 15365 - 21/05/2004


function TCtrlCentroCusto.RecuperaRespPorCentCust( iIdEmpresa : integer; sCodCentroCusto: string;
                                                   sTipoRespCentCust : string // Felipe A. Santos SOL 195376 KTN 1866485
                                                   ): OLEVariant;
var
  sSQL : string;
begin

  //Thaise - SOL 142865 - A pesquisa por pessoa precisa ter join com a tabela FUNCIONARIO,
  //pois o campo IDCHEFE é uma chave primária da própria tabela FUNCIONARIO com IDPESSOA,
  //não aceitando idpessoa que não seja também um funcionário
  sSQL := ' select R.IDRESPCENTCUST,              ' +
          '        R.IDPESSOA,                    ' +
          '        R.IDEMPRESA,                   ' +
          '        R.CODCENTROCUSTO,              ' +
          '        R.DTINICIOVIG,                 ' +
          '        R.DTFIMVIG,                    ' +
          '        R.PORTARIA,                    ' + // Felipe A. Santos SOL 195376 KTN 1866485
          '        R.TIPORESPCENTCUST,            ' + // Felipe A. Santos SOL 195376 KTN 1866485
          '        P.NOME,                        ' +
          '        F.IDCHEFE,                     ' + // Kintana 1423815  Sol 142865/6461 Otacilio ** Erro no Update IDCHEFE estava indo vazio **
          '        F.MATRICULA,                   ' + // Felipe A. Santos SOL 195376 KTN 1866485
          '        R.ORDEM                        ' + // SIG 60690
          ' from   RESPCENTCUST R,                ' +
          '        PESSOA       P,                ' +
          '        FUNCIONARIO  F                 ' +
          ' where  R.IDPESSOA       = P.IDPESSOA  ' +
          '   and  R.IDEMPRESA      = ' + IntToStr( iIdEmpresa ) +
          '   and  R.CODCENTROCUSTO = ' + QuotedStr( sCodCentroCusto ) +
          '   and  R.TIPORESPCENTCUST = ' + QuotedStr(sTipoRespCentCust) + // Felipe A. Santos SOL 195376 KTN 1866485
          '   and  P.IDPESSOA = F.IDPESSOA        ' +
          'order by r.dtiniciovig desc, r.dtfimvig, r.ordem '; //SIG 60690 - Inclusão do order by


  Result := GetDataPacket( sSQL );
end;

procedure TCtrlCentroCusto.SetcdsRespCentCust(const Value: TClientDataSet);
begin
  FcdsRespCentCust := Value;
end;

//   P 21368    03/02/06
Function TCtrlCentroCusto.CentCustExclui(pCodCentCust: Integer; IDEmpresa : Double) : Boolean;
Var
  sSqlLocal : string;
Begin

  If (ConnectionSide = cnsClient) Then
  Begin
    Result := Connection.AppServer.CentCustExclui(pCodCentCust);
    If (Not Result) Then
    Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End
  Else
  Begin
      sSqlLocal := 'DELETE FROM CENTCUST  ' +
                   'WHERE CODCENTROCUSTO = ' + InttoStr(pCODCENTCUST)  +
                   ' AND IDEMPRESA = ' +  FloatToStr(IdEmpresa);
      Result := ExecSql(sSqlLocal, True);
  End;
end;

//Brunno Mattos - SOL 142865 - KTN 917808  Início
function TCtrlCentroCusto.AtualizarResponsavelCentroCusto(IdEmpresa : Double; idNovoChefe , sCodCentroCusto : String) : Boolean;
  var sSql : String;
begin

  Try
    //Thaise - SOL 142865 - Quando entra um novo responsável pelo centro de custo,
    //todos os subordinados a ele precisam ter seu respectivo ID no campo IDCHEFE.
    sSql := '';
    sSql := 'UPDATE FUNCIONARIO ' +
            ' SET IDCHEFE =  ' + idNovoChefe +
            ' WHERE IDEMPRESA = 1  ' +
            ' AND  IDPESSOA not in( ' + idNovoChefe + ', ' + cdsRespCentCust.FieldByName('IDPESSOA').AsString + ')' +
            ' AND  CODCENTROCUSTO = ' + sCodCentroCusto  {cds.FieldByName('CODCENTROCUSTO').AsString} +  // SOL 182148 KTN 1649720 Higor Ferreira
            ' AND  IDSITFUNC ' +
            ' NOT IN (SELECT IDSITFUNC ' +
            ' FROM SITFUNC ' +
            ' WHERE TIPOSIT = ''D'' )';
    Result := ExecSQL(sSql);

  except
    On E:Exception Do
    begin
      Result := False;
      //Rollback;
      MessageInfo := 'Não foi possível associar os chefe ao funcionário, pois ele não possui registro como funcionário';
    end;
  end;
end;
//Brunno Mattos - SOL 142865 - KTN 917808  Fim

procedure TCtrlCentroCusto.SetcdsRespCentCustSub(
  const Value: TClientDataSet);
begin
  FcdsRespCentCustSub := Value; // Felipe A. Santos SOL 195376 KTN 1866485 
end;

// Thiago Melo SOL 236997 PPM 478691
function TCtrlCentroCusto.excluirResponsavelCentCust(_codCentCust: Integer;
  _idEmpresa: Double): Boolean;
var
  sSql : String;
begin

  try
    StartTransaction;
    // Responsável centro de custo
    sSql := 'DELETE FROM RESPCENTCUST' +
            ' WHERE CODCENTROCUSTO = ' + IntToStr(_codCentCust) +
            '   AND IDEMPRESA      = ' + FloatToStr(_idEmpresa);
    Result := ExecSql(sSQL);


    // Centro de custo
    sSql := 'DELETE FROM CENTCUST    ' +
            ' WHERE CODCENTROCUSTO = ' + InttoStr(_codCentCust)  +
            '   AND IDEMPRESA      = ' +  FloatToStr(_idEmpresa);
    Result := (Result and ExecSql(sSQL));

    if (not Result) then begin
      raise Exception.Create(MessageInfo);
      Rollback;
    end;

    Commit;
  except
    on E:Exception do
    begin
      Rollback;
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;
// Thiago Melo SOL 236997 PPM 478691

//Cássio Rovaroto - SIG nº 59823.59824 - Início
// Felipe A. Santos SOL 229874/16591 PPM 544751 - início
//function TCtrlCentroCusto.ListaLotacaoeSocial: OleVariant;
//var
//   sSQL : string;
//begin
  // Andre Imakawa SOL 258754/17869 PPM 1136600 - Removido IDLOTACAO e add CODLOTACAOESOCIAL - Inicio
//
//  sSQL := 'SELECT CODLOTACAOESOCIAL, ' +
//          '       SUBSTR(DESCRICAO, 1, 255) AS DESCCODLOTACAO ' +
//          '  FROM LOTACAOESOCIAL ' +
//          ' ORDER BY CODLOTACAOESOCIAL';
//
  // Andre Imakawa SOL 258754/17869 PPM 1136600 - Removido IDLOTACAO e add CODLOTACAOESOCIAL - Fim
//
//  Result := GetDataPacket(sSQL);
//
//end;
// Felipe A. Santos SOL 229874/16591 PPM 544751 - fim
//Cássio Rovaroto - SIG nº 59823.59824 - Fim
//Everson Cunha - SIG134236 - Ini
function TCtrlCentroCusto.ListaCentroCustoOrigem(CodCentroCusto: String): OleVariant;
var
  sSQL : string;
begin
  sSQL := ' select origem.codexterno codigo_ext, origem.nome desc_cc_origem, ' +
          '        h.* ' +
          '   from cm.hstcentcust h ' +
          '   join cm.centcust origem on trim(origem.codcentrocusto) = trim(h.codcentrocusto_origem) ' +
          '  where trim(h.codcentrocusto) =  ' + QuotedStr(CodCentroCusto);

  Result := GetDataPacket(sSQL);
end;
//Everson Cunha - SIG134236 - Fim

end.
