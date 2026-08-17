unit DImpostoObj;

{--------------------------------------------------------------------------------
Rotina    : SQLContabOrigemSCV
Data      : 06/10/2004
Autor     : Alex Pereira
Pendência : 14451 - Nova segregação de recursos
Descrição : Modificada a query para atender a nova segregação de recursos, campos:
            IDSEGREGACRITER e DATASEGREGACRITER
--------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   uCmSqlParams, Db, DBClient, uCMClientDataSet;

type
   TDtmImpostoObj = class(TDataModule)
      CdsAcumula: TClientDataSet;
      SQLAcumula: TCMSqlParams;
      CdsImposto: TClientDataSet;
      SQLImposto: TCMSqlParams;
      CdsFaixaImposto: TClientDataSet;
      SQLFaixaImposto: TCMSqlParams;
      CdsPortForma: TClientDataSet;
      SQLPortForma: TCMSqlParams;
      SQLClasFisCliFor: TCMSqlParams;
      CdsClasFisCliFor: TClientDataSet;
      SQLRateioImposto: TCMSqlParams;
      CdsRateioImposto: TClientDataSet;
      SQLRateioImposto2: TCMSqlParams;
      SQLRateioImposto3: TCMSqlParams;
      SQLBaseMes: TCMSqlParams;
      CdsBaseMes: TClientDataSet;
      SQLDadosLancImp: TCMSqlParams;
      CdsDadosLancImp: TClientDataSet;
      SQLDadosLancImpR: TCMSqlParams;
      SQLDadosLancImpP: TCMSqlParams;
      SQLAtuImpostoRetido: TCMSqlParams;
      SQLImpostoPorDoc: TCMSqlParams;
      CdsImpostoPorDoc: TClientDataSet;
      CdsAux: TClientDataSet;
      SQLAltNumLanc: TCMSqlParams;
      SQLAux: TCMSqlParams;
      SQLLancAcumula: TCMSqlParams;
      Cds: TClientDataSet;
      Sql: TCMSqlParams;
      SQLContabSCV: TCMSqlParams;
      CdsContabSCV: TCMClientDataSet;
      SQLContabOrigemSCV: TCMSqlParams;
      CdsContabOrigemSCV: TCMClientDataSet;
    SQLDadosLancImpsSemDocOrig: TCMSqlParams;

   private  // Private declarations

   public   // Public declarations

   end;


implementation
{$R *.DFM}



end.
