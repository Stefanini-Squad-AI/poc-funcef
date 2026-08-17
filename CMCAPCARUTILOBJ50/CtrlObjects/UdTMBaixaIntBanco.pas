//***************************************************************************************
//Rotina                : sqlDocumentos    
//N. Sol..........      : 214738_15892
//N. Kintana......      : 2057238
//Data da Alteração:    : 14/03/2014
//Alteração Form:       : uDtmBaixaIntBanco
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão do flag FLGMARCADO na sqlDocumentos
//******************************************************************************************

//  Autor     : Marcus Oliveira
//  Data      : 24.04.2007
//  Pendencia : 24823
//  Descrição : Mostrar só os portadores formas habilitados.
{
{ --------------------------------------------------------------------------------------------------
Rotina......: sqlDocumentos
Nº SOL......: 221352
Nº KINTANA..: 2053933
Data........: 26/11/2013
Responsável.: Edilaine Ferraresi
Descrição...: flag para baixa total
{ --------------------------------------------------------------------------------------------------
Rotina......: sqlDocumentos
Nº SOL......: 183486
Nº KINTANA..: 1718525
Data........: 05/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: filtro do grid para visualizar apenas recebimentos efetivados
---------------------------------------------------------------------------------------------------
Rotina............: bbtnConfirmarClick
N. Sol.............: 124570
N. Kintana......: 103005
Data...............: 20/12/2010
Responsável...: Gustavo Oliveira
Descrição........: Inclusão dos objetos SqlETL e QryInsertETL;
}
{-------------------------------------------------------------------------------
Pendência: 23081
Data     : 17/08/2006
Autor    : Andre Tavares
Descrição: Fazer a baixa dos documentos com o portadorforma original dos documentos.
Alterei a query sqlDocumentos
-------------------------------------------------------------------------------}



unit uDtmBaixaIntBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, Db, DBTables;

type
  TDtmBaixaIntBanco = class(TDataModule)
    SqlDocumentos: TCMSqlParams;
    SqlAuxCodDoc: TCMSqlParams;
    SqlPortaDorForma: TCMSqlParams;
    SqlParamCAP: TCMSqlParams;
    SqlOcorrencia: TCMSqlParams;
    SqlAux: TCMSqlParams;
    SqlUnid: TCMSqlParams;
    SqlModelosCnab: TCMSqlParams;
    SqlAlt: TCMSqlParams;
// Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início
    SqlETL: TCMSqlParams;
    QryInsertETL: TQuery;
// Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim
    sqlConvBancarioSIACC: TCMSqlParams; 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
